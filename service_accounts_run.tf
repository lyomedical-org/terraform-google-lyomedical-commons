resource "google_service_account" "run_test_public" {
	project=google_project.test_public.project_id
	account_id="cloud-run"
}
resource "google_project_iam_member" "serverless_robot_test_vpcaccess_user_on_svpc_host" {
	project=google_project.svpc_host.project_id
	role="roles/vpcaccess.user"
	member="serviceAccount:service-${google_project.test_public.number}@serverless-robot-prod.iam.gserviceaccount.com"
	depends_on=[
		google_project_service.cloudfunctions_test_public,
		google_project_service.run_test_public
	]
}
resource "google_project_iam_member" "serverless_robot_cloudfunctions_developer_on_test" {
	project=google_project.test.project_id
	role="roles/cloudfunctions.developer"
	member="serviceAccount:service-${google_project.test_public.number}@serverless-robot-prod.iam.gserviceaccount.com"
}
resource "google_project_iam_member" "gcf_agent_project_storage_viewer_on_test" {
	project=google_project.test.project_id
	role="roles/storage.objectViewer"
	member="serviceAccount:service-${google_project.test_public.number}@gcf-admin-robot.iam.gserviceaccount.com"
}
resource "google_project_iam_member" "gcf_agent_cloudfunctions_developer_on_test" {
	project=google_project.test.project_id
	role="roles/cloudfunctions.developer"
	member="serviceAccount:service-${google_project.test_public.number}@gcf-admin-robot.iam.gserviceaccount.com"
}
resource "google_project_iam_member" "run_test_public_iam_service_account_user_on_test_public" {
	project=google_project.test_public.project_id
	role="roles/iam.serviceAccountUser"
	member="serviceAccount:${google_service_account.run_test_public.email}"
}
resource "google_project_iam_member" "run_test_public_iam_service_account_user_on_svpc_host" {
	project=google_project.svpc_host.project_id
	role="roles/iam.serviceAccountUser"
	member="serviceAccount:${google_service_account.run_test_public.email}"
}
resource "google_project_iam_member" "run_test_public_compute_network_user_on_svpc_host" {
	project=google_project.svpc_host.project_id
	role="roles/compute.networkUser"
	member="serviceAccount:${google_service_account.run_test_public.email}"
}
resource "google_project_iam_member" "run_test_public_logging_log_writer_on_test" {
	project=google_project.test.project_id
	role="roles/logging.logWriter"
	member="serviceAccount:${google_service_account.run_test_public.email}"
}
resource "google_project_iam_member" "run_test_public_logging_log_writer_on_test_public" {
	project=google_project.test_public.project_id
	role="roles/logging.logWriter"
	member="serviceAccount:${google_service_account.run_test_public.email}"
}
resource "google_project_iam_member" "run_test_public_storage_object_admin_on_test" {
	project=google_project.test.project_id
	role="roles/storage.objectAdmin"
	member="serviceAccount:${google_service_account.run_test_public.email}"
}
resource "google_project_iam_member" "run_test_public_storage_object_admin_on_test_public" {
	project=google_project.test_public.project_id
	role="roles/storage.objectAdmin"
	member="serviceAccount:${google_service_account.run_test_public.email}"
}
resource "google_project_iam_member" "run_test_public_artifactregistry_admin_on_test" {
	project=google_project.test.project_id
	role="roles/artifactregistry.admin"
	member="serviceAccount:${google_service_account.run_test_public.email}"
}
resource "google_project_iam_member" "run_test_public_cloudbuild_builds_builder_on_svpc_host" {
	project=google_project.svpc_host.project_id
	role="roles/cloudbuild.builds.builder"
	member="serviceAccount:${google_service_account.run_test_public.email}"
}
resource "google_project_iam_member" "run_test_public_cloudbuild_builds_builder_on_test" {
	project=google_project.test.project_id
	role="roles/cloudbuild.builds.builder"
	member="serviceAccount:${google_service_account.run_test_public.email}"
}
resource "google_project_iam_member" "run_test_public_cloudfunctions_developer_on_svpc_host" {
	project=google_project.svpc_host.project_id
	role="roles/cloudfunctions.developer"
	member="serviceAccount:${google_service_account.run_test_public.email}"
}
resource "google_project_iam_member" "run_test_public_cloudfunctions_developer_on_test" {
	project=google_project.test.project_id
	role="roles/cloudfunctions.developer"
	member="serviceAccount:${google_service_account.run_test_public.email}"
}
resource "google_project_iam_member" "run_test_public_cloudfunctions_developer_on_test_public" {
	project=google_project.test_public.project_id
	role="roles/cloudfunctions.developer"
	member="serviceAccount:${google_service_account.run_test_public.email}"
}
resource "google_project_iam_member" "run_test_public_secretmanager_secret_accessor_on_test" {
	project=google_project.test.project_id
	role="roles/secretmanager.secretAccessor"
	member="serviceAccount:${google_service_account.run_test_public.email}"
}


