resource "google_service_account" "storage_test" {
	project=google_project.public.project_id
	account_id="storage-test"
}
resource "google_project_iam_member" "storage_test" {
	project=google_project.public.project_id
	role="roles/storage.objectAdmin"
	member="serviceAccount:${google_service_account.storage_test.email}"
}
resource "google_service_account" "storage_production" {
	project=google_project.public.project_id
	account_id="storage-production"
}
resource "google_project_iam_member" "storage_production" {
	project=google_project.public.project_id
	role="roles/storage.objectAdmin"
	member="serviceAccount:${google_service_account.storage_production.email}"
}
