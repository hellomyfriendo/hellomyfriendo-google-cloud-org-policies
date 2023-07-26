variable "org_id" {
  type        = string
  description = " The numeric ID of the organization."
}

variable "bootstrap_project_id" {
  type        = string
  description = "The bootstrap project ID."
}

variable "region" {
  type        = string
  description = "The default Google Cloud region for the created resources."
}

variable "org_policy_admin_sa_email" {
  type        = string
  description = "The Organization Policy Admin service account email."
}