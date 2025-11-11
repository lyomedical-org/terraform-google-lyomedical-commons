variable "project_id_commons" {
	type=string
	description="Project id commons"
}
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
variable "private_ip_range_pods_test" {
	type=string
	description="Private ip range pods test"
}
variable "private_ip_range_name_pods_test" {
	type=string
	description="Private ip range name pods test"
}
variable "private_ip_range_services_test" {
	type=string
	description="Private ip range services test"
}
variable "private_ip_range_name_services_test" {
	type=string
	description="Private ip range name services test"
}
variable "private_ip_range_master_test" {
	type=string
	description="Private ip range master test"
}
variable "private_ip_range_pods_production" {
	type=string
	description="Private ip range pods production"
}
variable "private_ip_range_name_pods_production" {
	type=string
	description="Private ip range name pods production"
}
variable "private_ip_range_services_production" {
	type=string
	description="Private ip range services production"
}
variable "private_ip_range_name_services_production" {
	type=string
	description="Private ip range name services production"
}
variable "private_ip_range_master_production" {
	type=string
	description="Private ip range master production"
}
variable "private_ip_range_pods_staging" {
	type=string
	description="Private ip range pods staging"
}
variable "private_ip_range_name_pods_staging" {
	type=string
	description="Private ip range name pods staging"
}
variable "private_ip_range_services_staging" {
	type=string
	description="Private ip range services staging"
}
variable "private_ip_range_name_services_staging" {
	type=string
	description="Private ip range name services staging"
}
variable "private_ip_range_master_staging" {
	type=string
	description="Private ip range master staging"
}
variable "public_subnetwork_cidr" {
	type=string
	description="Public subnetwork cidr"
}
variable "run_subnetwork_cidr" {
	type=string
	description="Run subnetwork cidr"
}
variable "private_service_access_address" {
	type=string
	description="Private service access address"
}
variable "private_service_access_prefix_length" {
	type=string
	description="Private service access prefix length"
}
variable "bastion_address" {
	type=string
	description="Bastion address"
}
variable "tfc_agent_version" {
	type=string
	description="Tfc agent version"
}
variable "tfc_agent_address" {
	type=string
	description="Tfc agent address"
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
variable "FOLDER_ID_STAGING" {
	type=string
	description="Folder id staging"
}
variable "GCP_REGION" {
	type=string
	description="Gcp region"
}
variable "GCP_ZONE" {
	type=string
	description="Gcp zone"
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
variable "BILLING_ACCOUNT_STAGING" {
	type=string
	description="Billing account staging"
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
variable "TERRAFORM_WORKSPACE_ID_STAGING" {
	description="Terraform workspace id staging"
	type=string
}
variable "TERRAFORM_AGENT_TOKEN" {
	description="Terraform agent token"
	type=string
}
variable "GITHUB_ORGANIZATION" {
	description="Github organization"
	type=string
}
