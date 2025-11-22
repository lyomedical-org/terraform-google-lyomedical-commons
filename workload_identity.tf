resource "google_iam_workload_identity_pool" "terraform_pool" {
	project=google_project.workload_identity.project_id
	workload_identity_pool_id="terraform-pool"
	depends_on=[google_project_service.sts_workload_identity]
}
resource "google_iam_workload_identity_pool_provider" "terraform_provider" {
	project=google_project.workload_identity.project_id
	workload_identity_pool_id=google_iam_workload_identity_pool.terraform_pool.workload_identity_pool_id
	workload_identity_pool_provider_id="terraform-provider"
	attribute_condition="assertion.terraform_organization_name==\"${var.TERRAFORM_ORGANIZATION_NAME}\""
	attribute_mapping={
		"google.subject"="assertion.sub"
		"attribute.terraform_workspace_id"="assertion.terraform_workspace_id"
		"attribute.terraform_full_workspace"="assertion.terraform_full_workspace"
	}
	oidc {
		issuer_uri="https://app.terraform.io"
	}
}
resource "google_service_account_iam_member" "terraform_workload_identity_user_public" {
	service_account_id=google_service_account.terraform_public.name
	role="roles/iam.workloadIdentityUser"
	member="principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.terraform_pool.name}/attribute.terraform_workspace_id/${var.TERRAFORM_WORKSPACE_ID_PUBLIC}"
}
resource "google_service_account_iam_member" "terraform_workload_identity_user_dev" {
	service_account_id=google_service_account.terraform_dev.name
	role="roles/iam.workloadIdentityUser"
	member="principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.terraform_pool.name}/attribute.terraform_workspace_id/${var.TERRAFORM_WORKSPACE_ID_DEV}"
}
resource "google_service_account_iam_member" "terraform_workload_identity_user_test" {
	service_account_id=google_service_account.terraform_test.name
	role="roles/iam.workloadIdentityUser"
	member="principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.terraform_pool.name}/attribute.terraform_workspace_id/${var.TERRAFORM_WORKSPACE_ID_TEST}"
}
resource "google_service_account_iam_member" "terraform_workload_identity_user_production" {
	service_account_id=google_service_account.terraform_production.name
	role="roles/iam.workloadIdentityUser"
	member="principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.terraform_pool.name}/attribute.terraform_workspace_id/${var.TERRAFORM_WORKSPACE_ID_PRODUCTION}"
}

resource "google_iam_workload_identity_pool" "github_pool" {
	project=google_project.workload_identity.project_id
	workload_identity_pool_id="github-pool"
	depends_on=[google_project_service.sts_workload_identity]
}
resource "google_iam_workload_identity_pool_provider" "github_provider" {
	project=google_project.workload_identity.project_id
	workload_identity_pool_id=google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
	workload_identity_pool_provider_id="github-provider"
	attribute_condition="attribute.repository_owner==\"${var.GITHUB_ORGANIZATION}\""
	attribute_mapping={
		"google.subject"="assertion.sub"
		"attribute.actor"="assertion.actor"
		"attribute.repository"="assertion.repository"
		"attribute.repository_owner"="assertion.repository_owner"
		"attribute.ref"="assertion.ref"
	}
	oidc {
		issuer_uri="https://token.actions.githubusercontent.com"
	}
}
resource "google_service_account_iam_member" "github_workload_identity_user_test" {
	service_account_id=google_service_account.run_ci_cd_test_public.name
	role="roles/iam.workloadIdentityUser"
	member="principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_pool.name}/attribute.repository_owner/${var.GITHUB_ORGANIZATION}"
}

resource "google_iam_workload_identity_pool" "storage_pool" {
	project=google_project.workload_identity.project_id
	workload_identity_pool_id="storage-pool"
	depends_on=[google_project_service.sts_workload_identity]
}
resource "google_iam_workload_identity_pool_provider" "storage_provider" {
	project=google_project.workload_identity.project_id
	workload_identity_pool_id=google_iam_workload_identity_pool.storage_pool.workload_identity_pool_id
	workload_identity_pool_provider_id="storage-provider"
	attribute_condition="google.subject==\"${local.storage_identity_subject}\""
	attribute_mapping={
		"google.subject"="assertion.sub"
	}
	oidc {
		issuer_uri="https://example.com"
	}
}
resource "google_service_account_iam_member" "storage_workload_identity_user_test" {
	service_account_id=google_service_account.storage_test.name
	role="roles/iam.workloadIdentityUser"
	member="principal://iam.googleapis.com/${google_iam_workload_identity_pool.storage_pool.name}/subject/${local.storage_identity_subject}"
}
resource "google_service_account_iam_member" "storage_workload_identity_user_production" {
	service_account_id=google_service_account.storage_production.name
	role="roles/iam.workloadIdentityUser"
	member="principal://iam.googleapis.com/${google_iam_workload_identity_pool.storage_pool.name}/subject/${local.storage_identity_subject}"
}

resource "google_iam_workload_identity_pool" "firebase_pool" {
	project=google_project.workload_identity.project_id
	workload_identity_pool_id="firebase-pool"
	depends_on=[google_project_service.sts_workload_identity]
}
resource "google_iam_workload_identity_pool_provider" "firebase_provider" {
	project=google_project.workload_identity.project_id
	workload_identity_pool_id=google_iam_workload_identity_pool.firebase_pool.workload_identity_pool_id
	workload_identity_pool_provider_id="firebase-provider"
	attribute_condition="assertion.sub==\"${local.firebase_identity_subject}\""
	attribute_mapping={
		"google.subject"="assertion.sub"
	}
	oidc {
		issuer_uri="https://storage.googleapis.com/${google_storage_bucket.oidc_issuer.name}"
	}
}
resource "google_service_account_iam_member" "firebase_workload_identity_user_dev" {
	service_account_id=google_service_account.firebase_admin_dev.name
	role="roles/iam.workloadIdentityUser"
	member="principal://iam.googleapis.com/${google_iam_workload_identity_pool.firebase_pool.name}/subject/${local.firebase_identity_subject}"
}
resource "google_service_account_iam_member" "firebase_workload_identity_user_test" {
	service_account_id=google_service_account.firebase_admin_test.name
	role="roles/iam.workloadIdentityUser"
	member="principal://iam.googleapis.com/${google_iam_workload_identity_pool.firebase_pool.name}/subject/${local.firebase_identity_subject}"
}
resource "google_service_account_iam_member" "firebase_workload_identity_user_production" {
	service_account_id=google_service_account.firebase_admin_production.name
	role="roles/iam.workloadIdentityUser"
	member="principal://iam.googleapis.com/${google_iam_workload_identity_pool.firebase_pool.name}/subject/${local.firebase_identity_subject}"
}

resource "null_resource" "generate_oidc_assets" {
	triggers={
		bucket_name=google_storage_bucket.oidc_issuer.name
		pool_provider_id=google_iam_workload_identity_pool_provider.firebase_provider.name
	}
	provisioner "local-exec" {
		environment={
			GCP_PROJECT_ID=var.project_id_public
			BUCKET_NAME=google_storage_bucket.oidc_issuer.name
			POOL_URI="projects/${google_project.workload_identity.number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.firebase_pool.workload_identity_pool_id}/providers/${google_iam_workload_identity_pool_provider.firebase_provider.workload_identity_pool_provider_id}"
			OUTPUT_DIR="${path.module}/files"
			FIREBASE_IDENTITY_SUBJECT=local.firebase_identity_subject
			TOOL_DIR="${path.cwd}/.terraform_tools"
		}
		command=<<EOT
      set -e
      gcloud config get-value account

      # --- C. Crypto Setup (No xxd required) ---
      TMP_DIR=$(mktemp -d)
      PRIVATE_KEY="$TMP_DIR/private.pem"
      PUBLIC_KEY="$TMP_DIR/public.pem"
      JWKS_FILE="$TMP_DIR/jwks.json"
      DISCOVERY_FILE="$TMP_DIR/openid-configuration"

      # Generate Keys
      openssl genrsa -out "$PRIVATE_KEY" 2048 2>/dev/null
      openssl rsa -in "$PRIVATE_KEY" -pubout -out "$PUBLIC_KEY" 2>/dev/null

      # Helper: Convert Hex to Base64URL using Python (Standard in most images)
      hex_to_b64url() {
        python3 -c "import sys, binascii, base64; \
        h = sys.argv[1]; \
        b = binascii.unhexlify(h); \
        print(base64.urlsafe_b64encode(b).decode('utf-8').rstrip('='), end='')" "$1"
      }

      # Parse RSA details
      MOD_HEX=$(openssl rsa -in "$PRIVATE_KEY" -noout -modulus | cut -d= -f2)
      MOD_B64=$(hex_to_b64url "$MOD_HEX")
      
      EXP_HEX=$(openssl rsa -in "$PRIVATE_KEY" -noout -text | grep "publicExponent" | awk '{print $2}' | sed 's/^(0x//;s/)//')
      if [ $(( $${#EXP_HEX} % 2 )) -eq 1 ]; then EXP_HEX="0$EXP_HEX"; fi
      EXP_B64=$(hex_to_b64url "$EXP_HEX")

      # --- D. Write & Upload JSONs ---
      # Write JWKS
      cat > "$JWKS_FILE" <<EOF
{
  "keys": [
    {
      "kty": "RSA",
      "alg": "RS256",
      "use": "sig",
      "kid": "key-1",
      "n": "$MOD_B64",
      "e": "$EXP_B64"
    }
  ]
}
EOF

      # Write Discovery Doc
      cat > "$DISCOVERY_FILE" <<EOF
{
  "issuer": "https://storage.googleapis.com/$BUCKET_NAME",
  "jwks_uri": "https://storage.googleapis.com/$BUCKET_NAME/jwks.json",
  "response_types_supported": ["id_token"],
  "subject_types_supported": ["public"],
  "id_token_signing_alg_values_supported": ["RS256"]
}
EOF

      echo "--> Uploading OIDC Config..."
      gcloud storage cp "$JWKS_FILE" "gs://$BUCKET_NAME/jwks.json"
      gcloud storage cp "$DISCOVERY_FILE" "gs://$BUCKET_NAME/.well-known/openid-configuration"

      # --- E. Sign JWT (Subject Token) ---
      # 1. Header
      HEADER_B64=$(echo -n '{"alg":"RS256","typ":"JWT","kid":"key-1"}' | openssl base64 -e | tr -d '=' | tr '/+' '_-' | tr -d '\n')
      
      # 2. Payload
      NOW=$(date +%s)
      EXP=$(($NOW + 315360000)) # 10 Year Validity
      
      # Construct JSON strictly safely
      PAYLOAD_JSON=$(printf '{"iss":"https://storage.googleapis.com/%s","sub":"$FIREBASE_IDENTITY_SUBJECT","aud":"//iam.googleapis.com/%s","iat":%d,"exp":%d}' \
        "$BUCKET_NAME" "$POOL_URI" "$NOW" "$EXP")
      
      PAYLOAD_B64=$(echo -n "$PAYLOAD_JSON" | openssl base64 -e | tr -d '=' | tr '/+' '_-' | tr -d '\n')
      
      # 3. Sign
      SIG_INPUT="$HEADER_B64.$PAYLOAD_B64"
      SIG_HEX=$(echo -n "$SIG_INPUT" | openssl dgst -sha256 -sign "$PRIVATE_KEY" -hex | awk '{print $2}')
      SIG_B64=$(hex_to_b64url "$SIG_HEX")
      
      JWT="$SIG_INPUT.$SIG_B64"

      # --- F. Output ---
      echo "--> Writing subject token..."
      mkdir -p "$OUTPUT_DIR"
      echo "{\"sub\":\"$JWT\"}" > "$OUTPUT_DIR/firebase-subject-token.json"
      
      # Cleanup
      rm -rf "$TMP_DIR"
    EOT
	}
	provisioner "local-exec" {
		command="cat ${path.module}/files/firebase-subject-token.json"
	}
	provisioner "local-exec" {
		command="cat ${path.module}/files/firebase-credentials.json"
	}
	provisioner "local-exec" {
		command="rm -rf ${path.module}/files"
	}
	depends_on=[
		null_resource.oidc_setup,
		google_storage_bucket_iam_member.oidc_issuer_public,
		google_iam_workload_identity_pool_provider.firebase_provider
	]
}


