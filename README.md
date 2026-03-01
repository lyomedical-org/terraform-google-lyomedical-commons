# terraform-google-lyomedical-commons

Terraform module for L&O Medical shared GCP resources. Manages the Shared VPC, workload identity federation, service accounts, API enablement, and Firebase configuration.

## Providers

| Provider | Version |
|----------|---------|
| hashicorp/google | 7.12.0 |
| hashicorp/google-beta | 7.12.0 |

## Usage

See `examples/example-1/main.tf` for a complete usage example.

## Resources

- **projects.tf** — GCP project configuration
- **apis.tf** — API enablement across projects
- **api-keys.tf** — API key management
- **vpc.tf** — Shared VPC network
- **cloud_nat.tf** — Cloud NAT for outbound connectivity
- **firewall_rules.tf** — VPC firewall rules
- **firebase.tf** — Firebase project setup
- **workload_identity.tf** — Workload Identity Federation for GitHub Actions CI/CD
- **service_accounts_*.tf** — Service accounts for Terraform, CI/CD, Cloud Run, Storage, and Firebase

## Requirements

- Terraform >= 1.9.3
- HCP Terraform authentication
