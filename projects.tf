# todo: deletion_policy PREVENT
resource "google_project" "workload_identity" {
	provider=google-beta
	project_id=var.project_id_workload_identity
	name="workload-identity-federation"
	folder_id=var.FOLDER_ID_COMMONS
	billing_account=var.BILLING_ACCOUNT_SHARED
	deletion_policy="DELETE"
}
resource "google_project" "svpc_host" {
	provider=google-beta
	project_id=var.project_id_svpc_host
	name="svpc-host"
	folder_id=var.FOLDER_ID_COMMONS
	billing_account=var.BILLING_ACCOUNT_SHARED
	deletion_policy="DELETE"
}
resource "google_project" "public" {
	provider=google-beta
	project_id=var.project_id_public
	name="public"
	folder_id=var.FOLDER_ID_PUBLIC
	billing_account=var.BILLING_ACCOUNT_SHARED
	deletion_policy="DELETE"
}
resource "google_project" "dev" {
	provider=google-beta
	project_id=var.project_id_dev
	name="dev-project"
	folder_id=var.FOLDER_ID_DEV
	billing_account=var.BILLING_ACCOUNT_DEV
	deletion_policy="DELETE"
}
resource "google_project" "test" {
	provider=google-beta
	project_id=var.project_id_test
	name="test"
	folder_id=var.FOLDER_ID_TEST
	billing_account=var.BILLING_ACCOUNT_TEST
	deletion_policy="DELETE"
}
resource "google_project" "production" {
	provider=google-beta
	project_id=var.project_id_production
	name="production"
	folder_id=var.FOLDER_ID_PRODUCTION
	billing_account=var.BILLING_ACCOUNT_PRODUCTION
	deletion_policy="DELETE"
}
resource "google_project" "dev_public" {
	provider=google-beta
	project_id=var.project_id_dev_public
	name="dev-project-public"
	folder_id=var.FOLDER_ID_PUBLIC
	billing_account=var.BILLING_ACCOUNT_DEV
	deletion_policy="DELETE"
}
resource "google_project" "test_public" {
	provider=google-beta
	project_id=var.project_id_test_public
	name="test-public"
	folder_id=var.FOLDER_ID_PUBLIC
	billing_account=var.BILLING_ACCOUNT_TEST
	deletion_policy="DELETE"
}
resource "google_project" "production_public" {
	provider=google-beta
	project_id=var.project_id_production_public
	name="production-public"
	folder_id=var.FOLDER_ID_PUBLIC
	billing_account=var.BILLING_ACCOUNT_PRODUCTION
	deletion_policy="DELETE"
}
