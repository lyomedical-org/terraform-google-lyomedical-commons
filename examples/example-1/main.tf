terraform {
	backend "remote" {
		hostname="app.terraform.io"
		organization="lyomedical"
		workspaces {
			name="app-dev-example"
		}
	}
}

module "lyomedical_commons_google" {
	source="app.terraform.io/lyomedical/lyomedical-commons/google"
	version="1.0.0"
}
