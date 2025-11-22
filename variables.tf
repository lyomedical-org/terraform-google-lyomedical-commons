variable "project_id_workload_identity" {
	type=string
	description="Project id workload identity"
}
variable "project_id_svpc_host" {
	type=string
	description="Project id svpc host"
}
variable "project_id_public" {
	type=string
	description="Project id public"
}
variable "project_id_dev" {
	type=string
	description="Project id dev"
}
variable "project_id_test" {
	type=string
	description="Project id test"
}
variable "project_id_production" {
	type=string
	description="Project id production"
}
variable "project_id_dev_public" {
	type=string
	description="Project id dev public"
}
variable "project_id_test_public" {
	type=string
	description="Project id test public"
}
variable "project_id_production_public" {
	type=string
	description="Project id production public"
}
variable "network_name" {
	type=string
	description="Network name"
}
variable "contact_email" {
	type=string
	description="Contact email"
}
variable "private_subnetwork_cidr" {
	type=string
	description="Private subnetwork cidr"
}
variable "public_subnetwork_cidr" {
	type=string
	description="Public subnetwork cidr"
}

variable "FOLDER_ID_COMMONS" {
	type=string
	description="Folder id commons"
}
variable "FOLDER_ID_PUBLIC" {
	type=string
	description="Folder id public"
}
variable "FOLDER_ID_DEV" {
	type=string
	description="Folder id dev"
}
variable "FOLDER_ID_TEST" {
	type=string
	description="Folder id test"
}
variable "FOLDER_ID_PRODUCTION" {
	type=string
	description="Folder id production"
}
variable "GCP_REGION" {
	type=string
	description="Gcp region"
}
variable "BILLING_ACCOUNT_SHARED" {
	type=string
	description="Billing account shared"
}
variable "BILLING_ACCOUNT_DEV" {
	type=string
	description="Billing account dev"
}
variable "BILLING_ACCOUNT_TEST" {
	type=string
	description="Billing account test"
}
variable "BILLING_ACCOUNT_PRODUCTION" {
	type=string
	description="Billing account production"
}
variable "RECAPTCHA_SITE_SECRET_DEV" {
	type=string
	description="Recaptcha site secret dev"
}
variable "TERRAFORM_ORGANIZATION_NAME" {
	description="Terraform organization name"
	type=string
}
variable "TERRAFORM_WORKSPACE_ID_PUBLIC" {
	description="Terraform workspace id public"
	type=string
}
variable "TERRAFORM_WORKSPACE_ID_DEV" {
	description="Terraform workspace id dev"
	type=string
}
variable "TERRAFORM_WORKSPACE_ID_TEST" {
	description="Terraform workspace id test"
	type=string
}
variable "TERRAFORM_WORKSPACE_ID_PRODUCTION" {
	description="Terraform workspace id production"
	type=string
}
variable "GITHUB_ORGANIZATION" {
	description="Github organization"
	type=string
}
