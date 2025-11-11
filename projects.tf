# todo: deletion_policy PREVENT
resource "google_project" "workload_identity" {
	project_id=var.project_id_workload_identity
	name="workload-identity-federation"
	folder_id=var.FOLDER_ID_COMMONS
	billing_account=var.BILLING_ACCOUNT_SHARED
	deletion_policy="DELETE"
}
resource "google_project" "svpc_host" {
	project_id=var.project_id_svpc_host
	name="svpc-host"
	folder_id=var.FOLDER_ID_COMMONS
	billing_account=var.BILLING_ACCOUNT_SHARED
	deletion_policy="DELETE"
}
resource "google_project" "public" {
	project_id=var.project_id_public
	name="public"
	folder_id=var.FOLDER_ID_PUBLIC
	billing_account=var.BILLING_ACCOUNT_SHARED
	deletion_policy="DELETE"
}
resource "google_project" "dev" {
	project_id=var.project_id_dev
	name="dev-project"
	folder_id=var.FOLDER_ID_DEV
	billing_account=var.BILLING_ACCOUNT_DEV
	deletion_policy="DELETE"
}
resource "google_project" "test" {
	project_id=var.project_id_test
	name="test"
	folder_id=var.FOLDER_ID_TEST
	billing_account=var.BILLING_ACCOUNT_TEST
	deletion_policy="DELETE"
}
resource "google_project" "production" {
	project_id=var.project_id_production
	name="production"
	folder_id=var.FOLDER_ID_PRODUCTION
	billing_account=var.BILLING_ACCOUNT_PRODUCTION
	deletion_policy="DELETE"
}
resource "google_project" "dev_public" {
	project_id=var.project_id_dev
	name="dev-project-public"
	folder_id=var.FOLDER_ID_PUBLIC
	billing_account=var.BILLING_ACCOUNT_DEV
	deletion_policy="DELETE"
}
resource "google_project" "test_public" {
	project_id=var.project_id_test
	name="test-public"
	folder_id=var.FOLDER_ID_PUBLIC
	billing_account=var.BILLING_ACCOUNT_TEST
	deletion_policy="DELETE"
}
resource "google_project" "production_public" {
	project_id=var.project_id_production
	name="production-public"
	folder_id=var.FOLDER_ID_PUBLIC
	billing_account=var.BILLING_ACCOUNT_PRODUCTION
	deletion_policy="DELETE"
}
