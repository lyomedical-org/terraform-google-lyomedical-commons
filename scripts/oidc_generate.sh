#!/bin/sh
set -e

# ==============================================================================
# OIDC Token & Config Generator
# Dependencies: openssl, jq, curl, gcloud, sed, base64, xxd
# ==============================================================================

echo "--> Starting OIDC generation for Bucket: $BUCKET_NAME"

# 0. Authenticate gcloud
# Terraform Cloud sets GOOGLE_APPLICATION_CREDENTIALS to a file path containing
# the Workload Identity configuration. We pass this to gcloud to authorize the upload.
if [ -n "$GOOGLE_APPLICATION_CREDENTIALS" ]; then
  echo "--> Authenticating gcloud using Workload Identity credentials..."
  gcloud auth login --cred-file="$GOOGLE_APPLICATION_CREDENTIALS" --quiet
  gcloud config set project "$GCP_PROJECT_ID" --quiet
else
  echo "--> WARNING: GOOGLE_APPLICATION_CREDENTIALS not set. Assuming environment is already authenticated."
fi

# 1. Create Temporary Directory
TMP_DIR=$(mktemp -d)
PRIVATE_KEY="$TMP_DIR/private.pem"
PUBLIC_KEY="$TMP_DIR/public.pem"
JWKS_FILE="$TMP_DIR/jwks.json"
DISCOVERY_FILE="$TMP_DIR/openid-configuration"

# 2. Generate RSA Keypair (2048 bit)
openssl genrsa -out "$PRIVATE_KEY" 2048 2>/dev/null
openssl rsa -in "$PRIVATE_KEY" -pubout -out "$PUBLIC_KEY" 2>/dev/null

# 3. Extract Modulus (n) and Exponent (e) for JWKS
# converting hex output from openssl to base64url
get_base64url() {
  xxd -r -p | base64 | tr -d '=' | tr '/+' '_-' | tr -d '\n'
}

# Parse Modulus
MODULUS_HEX=$(openssl rsa -in "$PRIVATE_KEY" -noout -modulus | cut -d= -f2)
MODULUS_B64=$(echo "$MODULUS_HEX" | get_base64url)

# Parse Exponent (usually 65537 -> 010001)
EXPONENT_HEX=$(openssl rsa -in "$PRIVATE_KEY" -noout -text | grep "publicExponent" | awk '{print $2}' | sed 's/^(0x//;s/)//')
# Ensure even number of hex digits for xxd
if [ $(( ${#EXPONENT_HEX} % 2 )) -eq 1 ]; then EXPONENT_HEX="0${EXPONENT_HEX}"; fi
EXPONENT_B64=$(echo "$EXPONENT_HEX" | get_base64url)

# 4. Create JWKS JSON
cat > "$JWKS_FILE" <<EOF
{
  "keys": [
    {
      "kty": "RSA",
      "alg": "RS256",
      "use": "sig",
      "kid": "key-1",
      "n": "$MODULUS_B64",
      "e": "$EXPONENT_B64"
    }
  ]
}
EOF

# 5. Create OIDC Discovery Document
cat > "$DISCOVERY_FILE" <<EOF
{
  "issuer": "https://storage.googleapis.com/${BUCKET_NAME}",
  "jwks_uri": "https://storage.googleapis.com/${BUCKET_NAME}/jwks.json",
  "response_types_supported": ["id_token"],
  "subject_types_supported": ["public"],
  "id_token_signing_alg_values_supported": ["RS256"]
}
EOF

# 6. Upload to GCS (Making them public)
echo "--> Uploading JWKS and Discovery doc to gs://${BUCKET_NAME}..."
gcloud storage cp "$JWKS_FILE" "gs://${BUCKET_NAME}/jwks.json"
gcloud storage cp "$DISCOVERY_FILE" "gs://${BUCKET_NAME}/.well-known/openid-configuration"

# 7. Generate the Signed JWT (Subject Token)
# Header
HEADER_JSON='{"alg":"RS256","typ":"JWT","kid":"key-1"}'
HEADER_B64=$(echo -n "$HEADER_JSON" | base64 | tr -d '=' | tr '/+' '_-' | tr -d '\n')

# Payload
# exp set to 10 year (315360000 seconds) to satisfy "run for a very long time" requirement
NOW=$(date +%s)
EXP=$(($NOW + 315360000))
PAYLOAD_JSON=$(cat <<EOF
{
  "iss": "https://storage.googleapis.com/${BUCKET_NAME}",
  "sub": "${FIREBASE_IDENTITY_SUBJECT}",
  "aud": "//iam.googleapis.com/${POOL_URI}",
  "iat": $NOW,
  "exp": $EXP
}
EOF
)
PAYLOAD_B64=$(echo -n "$PAYLOAD_JSON" | base64 | tr -d '=' | tr '/+' '_-' | tr -d '\n')

# Sign
SIGNATURE_INPUT="${HEADER_B64}.${PAYLOAD_B64}"
SIGNATURE_B64=$(echo -n "$SIGNATURE_INPUT" | openssl dgst -sha256 -sign "$PRIVATE_KEY" | base64 | tr -d '=' | tr '/+' '_-' | tr -d '\n')

JWT="${SIGNATURE_INPUT}.${SIGNATURE_B64}"

# 8. Write output files for the Node App
echo "--> Updating local credential files in ${OUTPUT_DIR}..."
mkdir -p "$OUTPUT_DIR"

# firebase-subject-token.json (Must contain the valid "sub" property as a wrapper or raw string depending on config)
# Based on your error, your config expects a JSON with a "sub" field containing the token.
cat > "${OUTPUT_DIR}/firebase-subject-token.json" <<EOF
{
  "sub": "$JWT"
}
EOF

cat "${OUTPUT_DIR}/firebase-subject-token.json"

# firebase-credentials.json
cat > "${OUTPUT_DIR}/firebase-credentials.json" <<EOF
{
  "type": "external_account",
  "audience": "//iam.googleapis.com/${POOL_URI}",
  "subject_token_type": "urn:ietf:params:oauth:token-type:jwt",
  "token_url": "https://sts.googleapis.com/v1/token",
  "service_account_impersonation_url": "https://iamcredentials.googleapis.com/v1/projects/-/serviceAccounts/${SERVICE_ACCOUNT_EMAIL}:generateAccessToken",
  "credential_source": {
    "file": "/app/secrets/firebase-subject-token/firebase-subject-token",
    "format": {
      "type": "json",
      "subject_token_field_name": "sub"
    }
  }
}
EOF

cat > "${OUTPUT_DIR}/firebase-credentials.json"

echo "--> Done. OIDC environment configured."
rm -rf "$TMP_DIR"