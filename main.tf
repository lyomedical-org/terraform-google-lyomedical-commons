data "google_client_config" "current" {}

locals {
	storage_identity_subject="app-storage"
	firebase_identity_subject="app-firebase"
	
}

# resource "null_resource" "oidc_setup" {
# 	provisioner "local-exec" {
# 		command = "chmod +x ${path.module}/scripts/install_oidc_dependencies.sh && ${path.module}/scripts/install_oidc_dependencies.sh"
# 	}
# }
resource "null_resource" "oidc_setup" {
	triggers={
		tools_version="v1"
	}
	provisioner "local-exec" {
		command=<<EOT
      set -e
      # Define a local tools directory within the workspace
      TOOL_DIR="${path.cwd}/.terraform_tools"
      mkdir -p "$TOOL_DIR"
      
      echo "--> Checking dependencies in $TOOL_DIR..."

      # 1. Install gcloud (if not found in system or local dir)
      if [ ! -f "$TOOL_DIR/google-cloud-sdk/bin/gcloud" ] && ! command -v gcloud >/dev/null; then
        echo "--> gcloud not found. Downloading..."
        curl -sL -o "$TOOL_DIR/gcloud.tar.gz" https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
        tar -xf "$TOOL_DIR/gcloud.tar.gz" -C "$TOOL_DIR"
        rm "$TOOL_DIR/gcloud.tar.gz"
        echo "--> gcloud installed locally."
      else
        echo "--> gcloud is ready."
      fi

      # 2. Install jq (if not found in system or local dir)
      if [ ! -f "$TOOL_DIR/jq" ] && ! command -v jq >/dev/null; then
        echo "--> jq not found. Downloading..."
        curl -sL -o "$TOOL_DIR/jq" https://github.com/jqlang/jq/releases/download/jq-1.7.1/jq-linux-64
        chmod +x "$TOOL_DIR/jq"
        echo "--> jq installed locally."
      else
        echo "--> jq is ready."
      fi
    EOT
	}
}