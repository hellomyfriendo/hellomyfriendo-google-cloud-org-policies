variable "org_id" {
  type        = string
  description = " The numeric ID of the organization."
}

variable "project_id" {
  type        = string
  description = "The project ID."
}

variable "allowed_policy_member_domains" {
  type        = list(string)
  description = "One or more Cloud Identity or Google Workspace customer IDs whose principals can be added to IAM policies."
}