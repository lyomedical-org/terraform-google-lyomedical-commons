resource "google_service_account" "storage_dev" {
	project=google_project.public.project_id
	account_id="storage-dev"
}
resource "google_service_account_key" "storage_dev" {
	service_account_id=google_service_account.storage_dev.name
}
resource "google_project_iam_member" "storage_dev" {
	project=google_project.public.project_id
	role="roles/storage.objectAdmin"
	member="serviceAccount:${google_service_account.storage_dev.email}"
}
resource "google_service_account" "storage_test" {
	project=google_project.public.project_id
	account_id="storage-test"
}
resource "google_service_account_key" "storage_test" {
	service_account_id=google_service_account.storage_test.name
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
resource "google_service_account_key" "storage_production" {
	service_account_id=google_service_account.storage_production.name
}
resource "google_project_iam_member" "storage_production" {
	project=google_project.public.project_id
	role="roles/storage.objectAdmin"
	member="serviceAccount:${google_service_account.storage_production.email}"
}
