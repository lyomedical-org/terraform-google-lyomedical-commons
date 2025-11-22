resource "google_project_service" "cloudresourcemanager_workload_identity" {
	project=google_project.workload_identity.project_id
	service="cloudresourcemanager.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
}
resource "google_project_service" "iam_workload_identity" {
	project=google_project.workload_identity.project_id
	service="iam.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_workload_identity]
}
resource "google_project_service" "iamcredentials_workload_identity" {
	project=google_project.workload_identity.project_id
	service="iamcredentials.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.iam_workload_identity]
}
resource "google_project_service" "sts_workload_identity" {
	project=google_project.workload_identity.project_id
	service="sts.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_workload_identity]
}

resource "google_project_service" "cloudresourcemanager_svpc_host" {
	project=google_project.svpc_host.project_id
	service="cloudresourcemanager.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
}
resource "google_project_service" "iam_svpc_host" {
	project=google_project.svpc_host.project_id
	service="iam.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_svpc_host]
}
resource "google_project_service" "iamcredentials_svpc_host" {
	project=google_project.svpc_host.project_id
	service="iamcredentials.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.iam_svpc_host]
}
resource "google_project_service" "networkmanagement_svpc_host" {
	project=google_project.svpc_host.project_id
	service="networkmanagement.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_svpc_host]
}
resource "google_project_service" "servicenetworking_svpc_host" {
	project=google_project.svpc_host.project_id
	service="servicenetworking.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_svpc_host]
}
resource "google_project_service" "dns_svpc_host" {
	project=google_project.svpc_host.project_id
	service="dns.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_svpc_host]
}
resource "google_project_service" "vpcaccess_svpc_host" {
	project=google_project.svpc_host.project_id
	service="vpcaccess.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_svpc_host]
}
resource "google_project_service" "compute_svpc_host" {
	project=google_project.svpc_host.project_id
	service="compute.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_svpc_host]
}
resource "google_project_service" "monitoring_svpc_host" {
	project=google_project.svpc_host.project_id
	service="monitoring.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_svpc_host]
}
resource "google_project_service" "logging_svpc_host" {
	project=google_project.svpc_host.project_id
	service="logging.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_svpc_host]
}
resource "google_project_service" "billingbudgets_svpc_host" {
	project=google_project.svpc_host.project_id
	service="billingbudgets.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_svpc_host]
}

resource "google_project_service" "cloudresourcemanager_public" {
	project=google_project.public.project_id
	service="cloudresourcemanager.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
}
resource "google_project_service" "iam_public" {
	project=google_project.public.project_id
	service="iam.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_public]
}
resource "google_project_service" "iamcredentials_public" {
	project=google_project.public.project_id
	service="iamcredentials.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.iam_public]
}
resource "google_project_service" "servicenetworking_public" {
	project=google_project.public.project_id
	service="servicenetworking.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_public]
}
resource "google_project_service" "compute_public" {
	project=google_project.public.project_id
	service="compute.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_public]
}

resource "google_project_service" "cloudresourcemanager_dev" {
	project=google_project.dev.project_id
	service="cloudresourcemanager.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
}
resource "google_project_service" "firebase_dev" {
	project=google_project.dev.project_id
	service="firebase.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
}
resource "google_project_service" "cloudresourcemanager_dev_public" {
	project=google_project.dev_public.project_id
	service="cloudresourcemanager.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
}

resource "google_project_service" "cloudresourcemanager_test" {
	project=google_project.test.project_id
	service="cloudresourcemanager.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
}
resource "google_project_service" "firebase_test" {
	project=google_project.test.project_id
	service="firebase.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
}
resource "google_project_service" "iam_test" {
	project=google_project.test.project_id
	service="iam.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_test]
}
resource "google_project_service" "iamcredentials_test" {
	project=google_project.test.project_id
	service="iamcredentials.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.iam_test]
}
resource "google_project_service" "servicenetworking_test" {
	project=google_project.test.project_id
	service="servicenetworking.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_test]
}
resource "google_project_service" "compute_test" {
	project=google_project.test.project_id
	service="compute.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_test]
}
resource "google_project_service" "monitoring_test" {
	project=google_project.test.project_id
	service="monitoring.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_test]
}
resource "google_project_service" "logging_test" {
	project=google_project.test.project_id
	service="logging.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_test]
}
resource "google_project_service" "artifactregistry_test" {
	project=google_project.test.project_id
	service="artifactregistry.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_test]
}
resource "google_project_service" "cloudbuild_test" {
	project=google_project.test.project_id
	service="cloudbuild.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_test]
}

resource "google_project_service" "cloudresourcemanager_test_public" {
	project=google_project.test_public.project_id
	service="cloudresourcemanager.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
}
resource "google_project_service" "iam_test_public" {
	project=google_project.test_public.project_id
	service="iam.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_test_public]
}
resource "google_project_service" "iamcredentials_test_public" {
	project=google_project.test_public.project_id
	service="iamcredentials.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.iam_test_public]
}
resource "google_project_service" "servicenetworking_test_public" {
	project=google_project.test_public.project_id
	service="servicenetworking.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_test_public]
}
resource "google_project_service" "compute_test_public" {
	project=google_project.test_public.project_id
	service="compute.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_test_public]
}
resource "google_project_service" "monitoring_test_public" {
	project=google_project.test_public.project_id
	service="monitoring.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_test_public]
}
resource "google_project_service" "logging_test_public" {
	project=google_project.test_public.project_id
	service="logging.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_test_public]
}
resource "google_project_service" "run_test_public" {
	project=google_project.test_public.project_id
	service="run.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_test_public]
}
resource "google_project_service" "cloudfunctions_test_public" {
	project=google_project.test_public.project_id
	service="cloudfunctions.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_test_public]
}

resource "google_project_service" "cloudresourcemanager_production" {
	project=google_project.production.project_id
	service="cloudresourcemanager.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
}
resource "google_project_service" "firebase_production" {
	project=google_project.production.project_id
	service="firebase.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
}
resource "google_project_service" "iam_production" {
	project=google_project.production.project_id
	service="iam.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_production]
}
resource "google_project_service" "iamcredentials_production" {
	project=google_project.production.project_id
	service="iamcredentials.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.iam_production]
}
resource "google_project_service" "servicenetworking_production" {
	project=google_project.production.project_id
	service="servicenetworking.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_production]
}
resource "google_project_service" "compute_production" {
	project=google_project.production.project_id
	service="compute.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_production]
}
resource "google_project_service" "monitoring_production" {
	project=google_project.production.project_id
	service="monitoring.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_production]
}
resource "google_project_service" "logging_production" {
	project=google_project.production.project_id
	service="logging.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_production]
}
resource "google_project_service" "artifactregistry_production" {
	project=google_project.production.project_id
	service="artifactregistry.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_production]
}
resource "google_project_service" "cloudbuild_production" {
	project=google_project.production.project_id
	service="cloudbuild.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_production]
}

resource "google_project_service" "cloudresourcemanager_production_public" {
	project=google_project.production_public.project_id
	service="cloudresourcemanager.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
}
resource "google_project_service" "iam_production_public" {
	project=google_project.production_public.project_id
	service="iam.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_production_public]
}
resource "google_project_service" "iamcredentials_production_public" {
	project=google_project.production_public.project_id
	service="iamcredentials.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.iam_production_public]
}
resource "google_project_service" "servicenetworking_production_public" {
	project=google_project.production_public.project_id
	service="servicenetworking.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_production_public]
}
resource "google_project_service" "compute_production_public" {
	project=google_project.production_public.project_id
	service="compute.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_production_public]
}
resource "google_project_service" "monitoring_production_public" {
	project=google_project.production_public.project_id
	service="monitoring.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_production_public]
}
resource "google_project_service" "logging_production_public" {
	project=google_project.production_public.project_id
	service="logging.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_production_public]
}
resource "google_project_service" "run_production_public" {
	project=google_project.production_public.project_id
	service="run.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_production_public]
}
resource "google_project_service" "cloudfunctions_production_public" {
	project=google_project.production_public.project_id
	service="cloudfunctions.googleapis.com"
	disable_dependent_services=true
	disable_on_destroy=true
	depends_on=[google_project_service.cloudresourcemanager_production_public]
}
