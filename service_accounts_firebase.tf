resource "google_service_account" "firebase_admin_dev" {
	provider=google-beta
	project=google_project.dev.project_id
	account_id="firebase-admin"
}
resource "google_service_account_key" "firebase_admin_dev" {
	service_account_id=google_service_account.firebase_admin_dev.name
}
resource "google_project_iam_member" "firebase_admin_dev_firebase_admin_on_dev" {
	provider=google-beta
	project=google_project.dev.project_id
	role="roles/firebase.admin"
	member="serviceAccount:${google_service_account.firebase_admin_dev.email}"
}
resource "google_service_account" "firebase_admin_test" {
	provider=google-beta
	project=google_project.test.project_id
	account_id="firebase-admin"
}
resource "google_service_account_key" "firebase_admin_test" {
	service_account_id=google_service_account.firebase_admin_test.name
}
resource "google_project_iam_member" "firebase_admin_test_firebase_admin_on_test" {
	provider=google-beta
	project=google_project.test.project_id
	role="roles/firebase.admin"
	member="serviceAccount:${google_service_account.firebase_admin_test.email}"
}
resource "google_service_account" "firebase_admin_production" {
	provider=google-beta
	project=google_project.production.project_id
	account_id="firebase-admin"
}
resource "google_service_account_key" "firebase_admin_production" {
	service_account_id=google_service_account.firebase_admin_production.name
}
resource "google_project_iam_member" "firebase_admin_production_firebase_admin_on_production" {
	provider=google-beta
	project=google_project.production.project_id
	role="roles/firebase.admin"
	member="serviceAccount:${google_service_account.firebase_admin_production.email}"
}
