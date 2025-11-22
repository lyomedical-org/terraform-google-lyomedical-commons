data "google_firebase_web_app_config" "web_dev" {
	provider=google-beta
	project=var.project_id_dev
	web_app_id=google_firebase_web_app.web_dev.app_id
}
resource "google_apikeys_key" "firebase_web_dev" {
	provider=google-beta
	project=var.project_id_dev
	name="firebase-web-dev"
	display_name="Firebase web dev"
	restrictions {
		browser_key_restrictions {
			allowed_referrers=["http://one.localhost"]
		}
	}
	depends_on=[google_firebase_project.dev]
}
resource "google_firebase_web_app" "web_dev" {
	provider=google-beta
	project=var.project_id_dev
	display_name="Web dev"
	api_key_id=google_apikeys_key.firebase_web_dev.uid
	deletion_policy="DELETE"
}
resource "time_sleep" "wait_30s" {
	create_duration="30s"
	depends_on=[google_firebase_web_app.web_dev]
}
resource "google_firebase_app_check_recaptcha_v3_config" "web_dev" {
	provider=google-beta
	project=var.project_id_dev
	app_id=google_firebase_web_app.web_dev.app_id
	site_secret=var.RECAPTCHA_SITE_SECRET_DEV
	token_ttl="7200s"
	depends_on=[time_sleep.wait_30s]
}

