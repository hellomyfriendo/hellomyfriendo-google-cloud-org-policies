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

module "tags" {
  source = "./modules/tags"

  org_id = var.org_id
}

module "org_policies" {
  source = "./modules/org_policies"

  org_id                        = var.org_id
  project_id                    = var.project_id
  allowed_policy_member_domains = local.allowed_policy_member_domains_list
  all_users_ingress_tag_key     = module.tags.all_users_ingress_tag_key
  all_users_ingress_tag_value   = module.tags.all_users_ingress_tag_value
}