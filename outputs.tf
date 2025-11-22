output "terraform_workload_identity_provider" {
	value=google_iam_workload_identity_pool_provider.terraform_provider.name
	description="Terraform workload identity provider"
}
output "terraform_service_account_email_public" {
	value=google_service_account.terraform_public.email
	description="Terraform service account email public"
}
output "terraform_service_account_email_dev" {
	value=google_service_account.terraform_dev.email
	description="Terraform service account email dev"
}
output "terraform_service_account_email_test" {
	value=google_service_account.terraform_test.email
	description="Terraform service account email test"
}
output "terraform_service_account_email_production" {
	value=google_service_account.terraform_production.email
	description="Terraform service account email production"
}
output "svpc_network_id" {
	value=google_compute_network.vpc.id
	description="Svpc network id"
}
output "svpc_self_link" {
	value=google_compute_network.vpc.self_link
	description="Svpc self link"
}
output "svpc_subnetwork_private_id" {
	value=google_compute_subnetwork.private.id
	description="Svpc subnetwork private id"
}
output "svpc_subnetwork_public_id" {
	value=google_compute_subnetwork.public.id
	description="Svpc subnetwork public id"
}
output "compute_address_nat" {
	value=google_compute_address.nat.address
	description="Compute address nat"
}
output "firebase_credentials_dev" {
	value=jsonencode({
		projectId=var.project_id_dev
		appId=google_firebase_web_app.web_dev.app_id
		apiKey=data.google_firebase_web_app_config.web_dev.api_key
		authDomain=data.google_firebase_web_app_config.web_dev.auth_domain
		databaseURL=lookup(data.google_firebase_web_app_config.web_dev,"database_url","")
		storageBucket=lookup(data.google_firebase_web_app_config.web_dev,"storage_bucket","")
		messagingSenderId=lookup(data.google_firebase_web_app_config.web_dev,"messaging_sender_id","")
		measurementId=lookup(data.google_firebase_web_app_config.web_dev,"measurement_id","")
	})
	description="Firebase credentials dev"
	sensitive=true
}
output "run_service_account_email_test_public" {
	value=google_service_account.run_test_public.email
	description="Run service account email test public"
}
output "run_service_account_id_test_public" {
	value=google_service_account.run_test_public.id
	description="Run service account id test public"
}
output "run_service_account_email_production_public" {
	value="google_service_account.run_production_public.email"
	description="Run service account email production public"
}
output "run_service_account_id_production_public" {
	value="google_service_account.run_production_public.id"
	description="Run service account id production public"
}
output "run_private_vpc_access_connector_id" {
	value=google_vpc_access_connector.run_private.id
	description="Run private vpc access connector id"
}
output "run_public_vpc_access_connector_id" {
	value=google_vpc_access_connector.run_public.id
	description="Run public vpc access connector id"
}
output "run_ci_cd_workload_identity_provider" {
	value=google_iam_workload_identity_pool_provider.github_provider.name
	description="Run ci cd workload identity provider"
}
output "run_ci_cd_service_account_email_test_public" {
	value=google_service_account.run_ci_cd_test_public.email
	description="Run ci cd service account email test public"
}
output "run_ci_cd_service_account_email_production_public" {
	value="google_service_account.run_ci_cd_production_public.email"
	description="Run ci cd service account email production public"
}
output "storage_workload_identity_provider" {
	value=google_iam_workload_identity_pool_provider.storage_provider.name
	description="Storage workload identity provider"
}
output "storage_service_account_email_test" {
	value=google_service_account.storage_test.email
	description="Storage service account email test"
}
output "storage_service_account_email_production" {
	value=google_service_account.storage_production.email
	description="Storage service account email production"
}
# todo: read sub from variables or secret manager
output "storage_subject_token" {
	value=jsonencode({
		sub=local.storage_identity_subject
		aud="app"
	})
	description="Storage subject token"
	sensitive=true
}
output "storage_credentials_test" {
	value=jsonencode({
		type="external_account"
		audience="//iam.googleapis.com/${google_iam_workload_identity_pool_provider.storage_provider.name}"
		subject_token_type="urn:ietf:params:oauth:token-type:jwt"
		token_url="https://sts.googleapis.com/v1/token"
		service_account_impersonation_url="https://iamcredentials.googleapis.com/v1/projects/-/serviceAccounts/${google_service_account.storage_test.email}:generateAccessToken"
		credential_source={
			file="/app/secrets/storage-subject-token/storage-subject-token"
			format={
				type="json"
				subject_token_field_name="sub"
			}
		}
	})
	description="Storage credentials test"
	sensitive=true
}
output "storage_credentials_production" {
	value=jsonencode({
		type="external_account"
		audience="//iam.googleapis.com/${google_iam_workload_identity_pool_provider.storage_provider.name}"
		subject_token_type="urn:ietf:params:oauth:token-type:jwt"
		token_url="https://sts.googleapis.com/v1/token"
		service_account_impersonation_url="https://iamcredentials.googleapis.com/v1/projects/-/serviceAccounts/${google_service_account.storage_production.email}:generateAccessToken"
		credential_source={
			file="/app/secrets/storage-subject-token/storage-subject-token"
			format={
				type="json"
				subject_token_field_name="sub"
			}
		}
	})
	description="Storage credentials production"
	sensitive=true
}
