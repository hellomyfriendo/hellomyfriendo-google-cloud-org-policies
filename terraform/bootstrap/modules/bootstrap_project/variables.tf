variable "org_id" {
  type        = string
  description = " The numeric ID of the organization."
}

variable "bootstrap_billing_account" {
  type        = string
  description = "The alphanumeric ID of the billing account the bootstrap project belongs to."
}

variable "bootstrap_project_name" {
  type        = string
  description = "The display name of the bootstrap project."
}

variable "bootstrap_project_id" {
  type        = string
  description = "The bootstrap project ID."
}

variable "region" {
  type        = string
  description = "The default Google Cloud region for the created resources."
}

variable "org_admin_sa_token_creators" {
  type        = list(string)
  description = "The emails of the users who will be allowed to impersonate the org-admin service account."
}
