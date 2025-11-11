resource "google_compute_router" "nat" {
	project=google_project.svpc_host.project_id
	name="${google_compute_network.vpc.name}-${var.GCP_REGION}-nat"
	region=var.GCP_REGION
	network=google_compute_network.vpc.name
}
resource "google_compute_address" "nat" {
	project=google_project.svpc_host.project_id
	name="${google_compute_network.vpc.name}-${var.GCP_REGION}-nat"
	region=var.GCP_REGION
	address_type="EXTERNAL"
}
resource "google_compute_router_nat" "nat" {
	project=google_project.svpc_host.project_id
	name="${google_compute_network.vpc.name}-${var.GCP_REGION}-nat"
	region=var.GCP_REGION
	router=google_compute_router.nat.name
	nat_ip_allocate_option="MANUAL_ONLY"
	nat_ips=[google_compute_address.nat.self_link]
	source_subnetwork_ip_ranges_to_nat="LIST_OF_SUBNETWORKS"
	subnetwork {
		name=google_compute_subnetwork.private.self_link
		source_ip_ranges_to_nat=["ALL_IP_RANGES"]
	}
	subnetwork {
		name=google_compute_subnetwork.public.self_link
		source_ip_ranges_to_nat=["ALL_IP_RANGES"]
	}
	# log_config {
	# 	filter="TRANSLATIONS_ONLY"
	# 	enable=true
	# }
}
