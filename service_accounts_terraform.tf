resource "google_service_account" "terraform_public" {
	project=google_project.public.project_id
	account_id="terraform"
}
resource "google_project_iam_member" "terraform_public_resourcemanager_project_iam_admin_on_public" {
	project=google_project.public.project_id
	role="roles/resourcemanager.projectIamAdmin"
	member="serviceAccount:${google_service_account.terraform_public.email}"
}
resource "google_project_iam_member" "terraform_public_iam_service_account_admin_on_public" {
	project=google_project.public.project_id
	role="roles/iam.serviceAccountAdmin"
	member="serviceAccount:${google_service_account.terraform_public.email}"
}
resource "google_project_iam_member" "terraform_public_iam_service_account_user_on_public" {
	project=google_project.public.project_id
	role="roles/iam.serviceAccountUser"
	member="serviceAccount:${google_service_account.terraform_public.email}"
}
resource "google_project_iam_member" "terraform_public_compute_admin_on_public" {
	project=google_project.public.project_id
	role="roles/compute.admin"
	member="serviceAccount:${google_service_account.terraform_public.email}"
}
resource "google_project_iam_member" "terraform_public_storage_admin_on_public" {
	project=google_project.public.project_id
	role="roles/storage.admin"
	member="serviceAccount:${google_service_account.terraform_public.email}"
}

resource "google_service_account" "terraform_dev" {
	project=google_project.dev.project_id
	account_id="terraform"
}

resource "google_service_account" "terraform_test" {
	project=google_project.test.project_id
	account_id="terraform"
}
resource "google_project_iam_member" "terraform_test_resourcemanager_project_iam_admin_on_test" {
	project=google_project.test.project_id
	role="roles/resourcemanager.projectIamAdmin"
	member="serviceAccount:${google_service_account.terraform_test.email}"
}
resource "google_project_iam_member" "terraform_test_iam_service_account_admin_on_test" {
	project=google_project.test.project_id
	role="roles/iam.serviceAccountAdmin"
	member="serviceAccount:${google_service_account.terraform_test.email}"
}
resource "google_project_iam_member" "terraform_test_iam_service_account_user_on_test" {
	project=google_project.test.project_id
	role="roles/iam.serviceAccountUser"
	member="serviceAccount:${google_service_account.terraform_test.email}"
}
resource "google_project_iam_member" "terraform_test_compute_admin_on_test" {
	project=google_project.test.project_id
	role="roles/compute.admin"
	member="serviceAccount:${google_service_account.terraform_test.email}"
}
resource "google_project_iam_member" "terraform_test_storage_admin_on_test" {
	project=google_project.test.project_id
	role="roles/storage.admin"
	member="serviceAccount:${google_service_account.terraform_test.email}"
}
resource "google_project_iam_member" "terraform_test_artifactregistry_admin_on_test" {
	project=google_project.test.project_id
	role="roles/artifactregistry.admin"
	member="serviceAccount:${google_service_account.terraform_test.email}"
}
resource "google_project_iam_member" "terraform_test_secretmanager_admin_on_test" {
	project=google_project.test.project_id
	role="roles/secretmanager.admin"
	member="serviceAccount:${google_service_account.terraform_test.email}"
}
resource "google_project_iam_member" "terraform_test_cloudfunctions_admin_on_test" {
	project=google_project.test.project_id
	role="roles/cloudfunctions.admin"
	member="serviceAccount:${google_service_account.terraform_test.email}"
}
resource "google_project_iam_member" "terraform_test_resourcemanager_project_iam_admin_on_test_public" {
	project=google_project.test_public.project_id
	role="roles/resourcemanager.projectIamAdmin"
	member="serviceAccount:${google_service_account.terraform_test.email}"
}
resource "google_project_iam_member" "terraform_test_iam_service_account_admin_on_test_public" {
	project=google_project.test_public.project_id
	role="roles/iam.serviceAccountAdmin"
	member="serviceAccount:${google_service_account.terraform_test.email}"
}
resource "google_project_iam_member" "terraform_test_iam_service_account_user_on_test_public" {
	project=google_project.test_public.project_id
	role="roles/iam.serviceAccountUser"
	member="serviceAccount:${google_service_account.terraform_test.email}"
}
resource "google_project_iam_member" "terraform_test_compute_admin_on_test_public" {
	project=google_project.test_public.project_id
	role="roles/compute.admin"
	member="serviceAccount:${google_service_account.terraform_test.email}"
}
resource "google_project_iam_member" "terraform_test_cloudfunctions_admin_on_test_public" {
	project=google_project.test_public.project_id
	role="roles/cloudfunctions.admin"
	member="serviceAccount:${google_service_account.terraform_test.email}"
}

resource "google_service_account" "terraform_production" {
	project=google_project.production.project_id
	account_id="terraform"
}
resource "google_project_iam_member" "terraform_production_resourcemanager_project_iam_admin_on_production" {
	project=google_project.production.project_id
	role="roles/resourcemanager.projectIamAdmin"
	member="serviceAccount:${google_service_account.terraform_production.email}"
}
resource "google_project_iam_member" "terraform_production_iam_service_account_admin_on_production" {
	project=google_project.production.project_id
	role="roles/iam.serviceAccountAdmin"
	member="serviceAccount:${google_service_account.terraform_production.email}"
}
resource "google_project_iam_member" "terraform_production_iam_service_account_user_on_production" {
	project=google_project.production.project_id
	role="roles/iam.serviceAccountUser"
	member="serviceAccount:${google_service_account.terraform_production.email}"
}
resource "google_project_iam_member" "terraform_production_compute_admin_on_production" {
	project=google_project.production.project_id
	role="roles/compute.admin"
	member="serviceAccount:${google_service_account.terraform_production.email}"
}
resource "google_project_iam_member" "terraform_production_storage_admin_on_production" {
	project=google_project.production.project_id
	role="roles/storage.admin"
	member="serviceAccount:${google_service_account.terraform_production.email}"
}
resource "google_project_iam_member" "terraform_production_artifactregistry_admin_on_production" {
	project=google_project.production.project_id
	role="roles/artifactregistry.admin"
	member="serviceAccount:${google_service_account.terraform_production.email}"
}
resource "google_project_iam_member" "terraform_production_secretmanager_admin_on_production" {
	project=google_project.production.project_id
	role="roles/secretmanager.admin"
	member="serviceAccount:${google_service_account.terraform_production.email}"
}
resource "google_project_iam_member" "terraform_production_cloudfunctions_admin_on_production" {
	project=google_project.production.project_id
	role="roles/cloudfunctions.admin"
	member="serviceAccount:${google_service_account.terraform_production.email}"
}
resource "google_project_iam_member" "terraform_production_resourcemanager_project_iam_admin_on_production_public" {
	project=google_project.production_public.project_id
	role="roles/resourcemanager.projectIamAdmin"
	member="serviceAccount:${google_service_account.terraform_production.email}"
}
resource "google_project_iam_member" "terraform_production_iam_service_account_admin_on_production_public" {
	project=google_project.production_public.project_id
	role="roles/iam.serviceAccountAdmin"
	member="serviceAccount:${google_service_account.terraform_production.email}"
}
resource "google_project_iam_member" "terraform_production_iam_service_account_user_on_production_public" {
	project=google_project.production_public.project_id
	role="roles/iam.serviceAccountUser"
	member="serviceAccount:${google_service_account.terraform_production.email}"
}
resource "google_project_iam_member" "terraform_production_compute_admin_on_production_public" {
	project=google_project.production_public.project_id
	role="roles/compute.admin"
	member="serviceAccount:${google_service_account.terraform_production.email}"
}
resource "google_project_iam_member" "terraform_production_cloudfunctions_admin_on_production_public" {
	project=google_project.production_public.project_id
	role="roles/cloudfunctions.admin"
	member="serviceAccount:${google_service_account.terraform_production.email}"
}
