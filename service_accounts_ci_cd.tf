resource "google_service_account" "run_ci_cd_test_public" {
	project=google_project.test_public.project_id
	account_id="run-ci-cd"
}
resource "google_project_iam_member" "run_ci_cd_test_public_iam_service_account_user" {
	project=google_project.test_public.project_id
	role="roles/iam.serviceAccountUser"
	member="serviceAccount:${google_service_account.run_ci_cd_test_public.email}"
}
resource "google_project_iam_member" "run_ci_cd_test_public_run_admin_on_test_public" {
	project=google_project.test_public.project_id
	role="roles/run.admin"
	member="serviceAccount:${google_service_account.run_ci_cd_test_public.email}"
}
resource "google_project_iam_member" "run_ci_cd_test_public_artifactregistry_admin_on_test_public" {
	project=google_project.test_public.project_id
	role="roles/artifactregistry.admin"
	member="serviceAccount:${google_service_account.run_ci_cd_test_public.email}"
}
resource "google_project_iam_member" "run_ci_cd_test_public_cloudfunctions_admin_on_test_public" {
	project=google_project.test_public.project_id
	role="roles/cloudfunctions.admin"
	member="serviceAccount:${google_service_account.run_ci_cd_test_public.email}"
}
resource "google_project_iam_member" "run_ci_cd_test_public_run_admin_on_test" {
	project=google_project.test.project_id
	role="roles/run.admin"
	member="serviceAccount:${google_service_account.run_ci_cd_test_public.email}"
}
resource "google_project_iam_member" "run_ci_cd_test_public_artifactregistry_admin_on_test" {
	project=google_project.test.project_id
	role="roles/artifactregistry.admin"
	member="serviceAccount:${google_service_account.run_ci_cd_test_public.email}"
}
resource "google_project_iam_member" "run_ci_cd_test_public_cloudfunctions_admin_on_test" {
	project=google_project.test.project_id
	role="roles/cloudfunctions.admin"
	member="serviceAccount:${google_service_account.run_ci_cd_test_public.email}"
}

resource "google_service_account" "run_ci_cd_production_public" {
	project=google_project.production_public.project_id
	account_id="run-ci-cd"
}
resource "google_project_iam_member" "run_ci_cd_production_public_iam_service_account_user" {
	project=google_project.production_public.project_id
	role="roles/iam.serviceAccountUser"
	member="serviceAccount:${google_service_account.run_ci_cd_production_public.email}"
}
resource "google_project_iam_member" "run_ci_cd_production_public_run_admin_on_production_public" {
	project=google_project.production_public.project_id
	role="roles/run.admin"
	member="serviceAccount:${google_service_account.run_ci_cd_production_public.email}"
}
resource "google_project_iam_member" "run_ci_cd_production_public_artifactregistry_admin_on_production_public" {
	project=google_project.production_public.project_id
	role="roles/artifactregistry.admin"
	member="serviceAccount:${google_service_account.run_ci_cd_production_public.email}"
}
resource "google_project_iam_member" "run_ci_cd_production_public_cloudfunctions_admin_on_production_public" {
	project=google_project.production_public.project_id
	role="roles/cloudfunctions.admin"
	member="serviceAccount:${google_service_account.run_ci_cd_production_public.email}"
}
resource "google_project_iam_member" "run_ci_cd_production_public_run_admin_on_production" {
	project=google_project.production.project_id
	role="roles/run.admin"
	member="serviceAccount:${google_service_account.run_ci_cd_production_public.email}"
}
resource "google_project_iam_member" "run_ci_cd_production_public_artifactregistry_admin_on_production" {
	project=google_project.production.project_id
	role="roles/artifactregistry.admin"
	member="serviceAccount:${google_service_account.run_ci_cd_production_public.email}"
}
resource "google_project_iam_member" "run_ci_cd_production_public_cloudfunctions_admin_on_production" {
	project=google_project.production.project_id
	role="roles/cloudfunctions.admin"
	member="serviceAccount:${google_service_account.run_ci_cd_production_public.email}"
}
