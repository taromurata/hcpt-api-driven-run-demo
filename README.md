# HCP Terraform API Driven Run Demo

## Usage

Before use this script, you need to set `TOKEN` env var to your HCP Terraform / Terraform Enterprise  API token.

- hcpt\_push.sh
  - Push configuration files under `terraform` directory to specified workspace.
  - Automatically run `terraform plan`
  - If you enable `auto_apply`, apply run also runs.
- hcpt\_apply.sh
  - Apply run on specified workspace.
