data "google_client_config" "current" {}

locals {
	storage_identity_subject="app-storage"
	firebase_identity_subject="app-firebase"
	
}

resource "null_resource" "oidc_setup" {
	provisioner "local_exec" {
		command = "chmod +x ${path.module}/scripts/install_oidc_dependencies.sh && ${path.module}/scripts/install_oidc_dependencies.sh"
	}
}