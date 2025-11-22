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
		tools="openssl,jq,curl,gcloud,sed,base64,xxd"
	}
	provisioner "local-exec" {
		command="sudo apt-get update"
	}
	provisioner "local-exec" {
		command="sudo apt-get install -y apt-transport-https ca-certificates gnupg curl openssl jq sed coreutils"
	}
	provisioner "local-exec" {
		command="sudo apt-get install -y xxd"
	}
	provisioner "local-exec" {
		command="curl -o gcloud.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz"
	}
	provisioner "local-exec" {
		command="tar -xf gcloud.tar.gz && ./google-cloud-sdk/install.sh"
	}
}