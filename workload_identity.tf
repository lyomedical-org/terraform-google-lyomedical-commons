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
		command="chmod +x ${path.module}/scripts/oidc_generate.sh && ${path.module}/scripts/oidc_generate.sh"
		environment={
			GCP_PROJECT_ID=google_project.public.project_id
			BUCKET_NAME=google_storage_bucket.oidc_issuer.name
			POOL_URI="projects/${google_project.workload_identity.number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.firebase_pool.workload_identity_pool_id}/providers/${google_iam_workload_identity_pool_provider.firebase_provider.workload_identity_pool_provider_id}"
			SERVICE_ACCOUNT_EMAIL=google_service_account.firebase_admin_dev.email
			OUTPUT_DIR="${path.module}/files"
			FIREBASE_IDENTITY_SUBJECT=local.firebase_identity_subject
		}
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


