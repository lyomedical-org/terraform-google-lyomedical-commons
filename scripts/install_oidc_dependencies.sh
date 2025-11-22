#!/bin/sh
set -e

# Helper to run with sudo if available and user is not root
run_cmd() {
    if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null; then
        sudo "$@"
    else
        "$@"
    fi
}

echo "--> Checking and installing dependencies (Target: Debian/Ubuntu)..."

# 1. Initial Update & Essentials
# We need apt-transport-https and gnupg to add the Google Cloud repo safely
echo "--> Updating apt cache and installing prerequisites..."
run_cmd apt-get update -y
run_cmd apt-get install -y apt-transport-https ca-certificates gnupg curl openssl jq sed coreutils

# 2. Install Google Cloud SDK (gcloud)
if ! command -v gcloud >/dev/null; then
    echo "--> 'gcloud' not found. Adding Google Cloud SDK repository..."

    # Add the Cloud SDK distribution URI as a package source
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | \
    run_cmd tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

    # Import the Google Cloud public key
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
    run_cmd gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

    # Update and Install
    run_cmd apt-get update -y
    run_cmd apt-get install -y google-cloud-cli
else
    echo "--> 'gcloud' is already installed."
fi

# 3. Install xxd
# On Debian/Ubuntu, xxd is often part of 'xxd' or 'vim-common'
if ! command -v xxd >/dev/null; then
    echo "--> 'xxd' not found. Installing..."
    run_cmd apt-get install -y xxd || run_cmd apt-get install -y vim-common
else
    echo "--> 'xxd' is already installed."
fi

echo "--> Dependency installation complete."