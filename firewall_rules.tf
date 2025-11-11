resource "google_compute_firewall" "deny_all_egress" {
	project=google_project.svpc_host.project_id
	name="deny-all-egress"
	network=google_compute_network.vpc.self_link
	direction="EGRESS"
	priority=65530
	deny {
		protocol="all"
	}
	destination_ranges=["0.0.0.0/0"]
	# log_config {
	# 	metadata="INCLUDE_ALL_METADATA"
	# }
}
resource "google_compute_firewall" "allow_public_to_internet" {
	project=google_project.svpc_host.project_id
	name="allow-public-to-internet"
	network=google_compute_network.vpc.self_link
	direction="EGRESS"
	priority=100
	allow {
		protocol="all"
	}
	source_ranges=[var.public_subnetwork_cidr]
	destination_ranges=["0.0.0.0/0"]
	# log_config {
	# 	metadata="INCLUDE_ALL_METADATA"
	# }
}
