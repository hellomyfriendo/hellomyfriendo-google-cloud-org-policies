locals {
  allowed_policy_member_domains_list = split(",", var.allowed_policy_member_domains)
}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

module "org_policies" {
  source = "./modules/org_policies"

  org_id                        = var.org_id
  project_id                    = var.project_id
  allowed_policy_member_domains = local.allowed_policy_member_domains_list
}