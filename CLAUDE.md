# CLAUDE.md — terraform-google-lyomedical-commons

Terraform module for L&O Medical shared GCP resources: VPC, workload identity, service accounts, APIs, and Firebase.

## Providers

- hashicorp/google 7.12.0
- hashicorp/google-beta 7.12.0

## Key Files

- `main.tf` — Module entry point
- `projects.tf` — GCP project configuration
- `apis.tf` — API enablement
- `api-keys.tf` — API key management
- `vpc.tf` — Shared VPC configuration
- `cloud_nat.tf` — Cloud NAT setup
- `firewall_rules.tf` — VPC firewall rules
- `firebase.tf` — Firebase project setup
- `workload_identity.tf` — Workload Identity Federation (for CI/CD)
- `service_accounts_terraform.tf` — Terraform service accounts
- `service_accounts_ci_cd.tf` — CI/CD service accounts
- `service_accounts_run.tf` — Cloud Run service accounts
- `service_accounts_storage.tf` — Storage service accounts
- `service_accounts_firebase.tf` — Firebase service accounts
- `variables.tf` — Input variables
- `outputs.tf` — Module outputs
- `versions.tf` — Provider version constraints
- `examples/example-1/main.tf` — Usage example

## Commands

```bash
terraform init
terraform plan
terraform apply
```
