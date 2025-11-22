resource "google_storage_bucket" "oidc_issuer" {
	project=google_project.public.project_id
	name="${var.project_id_public}-oidc-issuer"
	location="US"
	uniform_bucket_level_access=true
	force_destroy=true
}
resource "google_storage_bucket_iam_member" "oidc_issuer_public" {
	bucket=google_storage_bucket.oidc_issuer.name
	role="roles/storage.objectViewer"
	member="allUsers"
}
