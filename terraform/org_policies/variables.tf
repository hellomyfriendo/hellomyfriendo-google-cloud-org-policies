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

variable "allowed_policy_member_domains" {
  type        = list(string)
  description = "One or more Cloud Identity or Google Workspace customer IDs whose principals can be added to IAM policies."
}

variable "org_policy_admin_sa_email" {
  type        = string
  description = "The Organization Policy Admin service account email."
}