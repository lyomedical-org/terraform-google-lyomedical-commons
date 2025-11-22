data "google_firebase_web_app_config" "web_dev" {
	provider=google-beta
	project=var.project_id_dev
	web_app_id=google_firebase_web_app.web_dev2.app_id
}
resource "google_apikeys_key" "firebase_web_dev" {
	provider=google-beta
	project=var.project_id_dev
	name="firebase-web"
	display_name="Firebase web"
	restrictions {
		browser_key_restrictions {
			allowed_referrers=["http://one.localhost"]
		}
	}
	depends_on=[google_firebase_project.dev]
}
resource "google_firebase_web_app" "web_dev2" {
	provider=google-beta
	project=var.project_id_dev
	display_name="Web dev"
	api_key_id=google_apikeys_key.firebase_web_dev.uid
	deletion_policy="DELETE"
}
data "google_firebase_web_app_config" "web_test" {
	provider=google-beta
	project=var.project_id_test
	web_app_id=google_firebase_web_app.web_test.app_id
}
resource "google_apikeys_key" "firebase_web_test" {
	provider=google-beta
	project=var.project_id_test
	name="firebase-web"
	display_name="Firebase web"
	restrictions {
		browser_key_restrictions {
			allowed_referrers=["http://${var.host_web_test}"]
		}
	}
	depends_on=[google_firebase_project.test]
}
resource "google_firebase_web_app" "web_test" {
	provider=google-beta
	project=var.project_id_test
	display_name="Web"
	api_key_id=google_apikeys_key.firebase_web_test.uid
	deletion_policy="DELETE"
}
data "google_firebase_web_app_config" "web_production" {
	provider=google-beta
	project=var.project_id_production
	web_app_id=google_firebase_web_app.web_production.app_id
}
resource "google_apikeys_key" "firebase_web_production" {
	provider=google-beta
	project=var.project_id_production
	name="firebase-web"
	display_name="Firebase web"
	restrictions {
		browser_key_restrictions {
			allowed_referrers=["http://${var.host_web_production}"]
		}
	}
	depends_on=[google_firebase_project.production]
}
resource "google_firebase_web_app" "web_production" {
	provider=google-beta
	project=var.project_id_production
	display_name="Web"
	api_key_id=google_apikeys_key.firebase_web_production.uid
	deletion_policy="DELETE"
}

resource "time_sleep" "wait_30s" {
	create_duration="30s"
	depends_on=[
		google_firebase_web_app.web_dev2,
		google_firebase_web_app.web_test,
		google_firebase_web_app.web_production
	]
}

resource "google_firebase_app_check_recaptcha_v3_config" "web_dev" {
	provider=google-beta
	project=var.project_id_dev
	app_id=google_firebase_web_app.web_dev2.app_id
	site_secret=var.RECAPTCHA_SITE_SECRET_DEV
	token_ttl="7200s"
	depends_on=[time_sleep.wait_30s]
}
resource "google_firebase_app_check_recaptcha_v3_config" "web_test" {
	provider=google-beta
	project=var.project_id_test
	app_id=google_firebase_web_app.web_test.app_id
	site_secret=var.RECAPTCHA_SITE_SECRET_TEST
	token_ttl="7200s"
	depends_on=[time_sleep.wait_30s]
}
resource "google_firebase_app_check_recaptcha_v3_config" "web_production" {
	provider=google-beta
	project=var.project_id_production
	app_id=google_firebase_web_app.web_production.app_id
	site_secret=var.RECAPTCHA_SITE_SECRET_PRODUCTION
	token_ttl="7200s"
	depends_on=[time_sleep.wait_30s]
}

resource "google_service_account" "firebase_admin_dev" {
	provider=google-beta
	project=google_project.dev.project_id
	account_id="firebase-admin"
	display_name="Firebase Admin"
}
resource "google_project_iam_member" "firebase_admin_dev_firebase_admin_on_dev" {
	provider=google-beta
	project=google_project.dev.project_id
	role="roles/firebase.admin"
	member="serviceAccount:${google_service_account.firebase_admin_dev.email}"
}
# resource "google_service_account_key" "firebase_admin_dev_key" {
# 	provider=google-beta
# 	service_account_id=google_service_account.firebase_admin_dev.name
# }
resource "google_service_account" "firebase_admin_test" {
	provider=google-beta
	project=google_project.test.project_id
	account_id="firebase-admin"
	display_name="Firebase Admin"
}
resource "google_project_iam_member" "firebase_admin_test_firebase_admin_on_test" {
	provider=google-beta
	project=google_project.test.project_id
	role="roles/firebase.admin"
	member="serviceAccount:${google_service_account.firebase_admin_test.email}"
}
resource "google_service_account" "firebase_admin_production" {
	provider=google-beta
	project=google_project.production.project_id
	account_id="firebase-admin"
	display_name="Firebase Admin"
}
resource "google_project_iam_member" "firebase_admin_production_firebase_admin_on_production" {
	provider=google-beta
	project=google_project.production.project_id
	role="roles/firebase.admin"
	member="serviceAccount:${google_service_account.firebase_admin_production.email}"
}
