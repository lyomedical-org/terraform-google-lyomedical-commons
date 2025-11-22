resource "google_apikeys_key" "web_dev" {
	provider=google-beta
	project=var.project_id_dev
	name="web"
	display_name="Web"
	restrictions {
		browser_key_restrictions {
			allowed_referrers=["http://one.localhost"]
		}
	}
	depends_on=[google_project.dev]
}
resource "google_apikeys_key" "web_test" {
	provider=google-beta
	project=var.project_id_test
	name="web"
	display_name="Web"
	restrictions {
		browser_key_restrictions {
			allowed_referrers=["https://${var.host_web_test}"]
		}
	}
	depends_on=[google_project.test]
}
resource "google_apikeys_key" "web_production" {
	provider=google-beta
	project=var.project_id_production
	name="web"
	display_name="Web"
	restrictions {
		browser_key_restrictions {
			allowed_referrers=["https://${var.host_web_production}"]
		}
	}
	depends_on=[google_project.production]
}
