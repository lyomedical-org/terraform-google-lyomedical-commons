resource "google_compute_network" "vpc" {
	project=google_project.svpc_host.project_id
	name=var.network_name
	routing_mode="GLOBAL"
	auto_create_subnetworks=false
	delete_default_routes_on_create=true
	depends_on=[
		google_project_service.compute_svpc_host
	]
}
resource "google_compute_subnetwork" "private" {
	project=google_project.svpc_host.project_id
	name="private"
	region=var.GCP_REGION
	network=google_compute_network.vpc.name
	ip_cidr_range=var.private_subnetwork_cidr
	private_ip_google_access=true
	# log_config {
	# 	aggregation_interval="INTERVAL_10_MIN"
	# 	flow_sampling=0.7
	# 	metadata="INCLUDE_ALL_METADATA"
	# }
}
resource "google_compute_subnetwork" "public" {
	project=google_project.svpc_host.project_id
	name="public"
	region=var.GCP_REGION
	network=google_compute_network.vpc.name
	ip_cidr_range=var.public_subnetwork_cidr
	private_ip_google_access=true
	# log_config {
	# 	aggregation_interval="INTERVAL_10_MIN"
	# 	flow_sampling=0.7
	# 	metadata="INCLUDE_ALL_METADATA"
	# }
}
resource "google_compute_route" "default_internet_route" {
	project=google_project.svpc_host.project_id
	name="default-egress-to-internet"
	network=google_compute_network.vpc.name
	dest_range="0.0.0.0/0"
	next_hop_gateway="default-internet-gateway"
	priority=1001
}
resource "google_compute_shared_vpc_host_project" "host" {
	project=google_project.svpc_host.project_id
	depends_on=[
		google_project_service.compute_svpc_host
	]
}
resource "google_compute_shared_vpc_service_project" "test" {
	host_project=google_compute_shared_vpc_host_project.host.project
	service_project=google_project.test.project_id
	depends_on=[
		google_project_service.compute_test
	]
}
resource "google_compute_shared_vpc_service_project" "production" {
	host_project=google_compute_shared_vpc_host_project.host.project
	service_project=google_project.production.project_id
	depends_on=[
		google_project_service.compute_production
	]
}
resource "google_compute_shared_vpc_service_project" "test_public" {
	host_project=google_compute_shared_vpc_host_project.host.project
	service_project=google_project.test_public.project_id
	depends_on=[
		google_project_service.compute_test_public
	]
}
resource "google_compute_shared_vpc_service_project" "production_public" {
	host_project=google_compute_shared_vpc_host_project.host.project
	service_project=google_project.production_public.project_id
	depends_on=[
		google_project_service.compute_production_public
	]
}
resource "google_vpc_access_connector" "run_public" {
	project=google_project.svpc_host.project_id
	name="run-public"
	region=var.GCP_REGION
	subnet {
		name=google_compute_subnetwork.public.name
	}
	min_instances=2
	max_instances=10
	depends_on=[google_project_service.vpcaccess_svpc_host]
}
resource "google_vpc_access_connector" "run_private" {
	project=google_project.svpc_host.project_id
	name="run-private"
	region=var.GCP_REGION
	subnet {
		name=google_compute_subnetwork.private.name
	}
	min_instances=2
	max_instances=10
	depends_on=[google_project_service.vpcaccess_svpc_host]
}
