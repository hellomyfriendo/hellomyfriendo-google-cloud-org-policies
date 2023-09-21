provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

module "enable_apis" {
  source = "./modules/enable_apis"
}

module "iam" {
  source = "./modules/iam"

  org_id = var.org_id
}

module "apps" {
  source = "./modules/apps"

  org_id                        = var.org_id
  region                        = var.region
  allowed_policy_member_domains = var.allowed_policy_member_domains
  sourcerepo_name               = var.sourcerepo_name
  branch_name                   = var.branch_name
  tfstate_bucket                = google_storage_bucket.tfstate.name
}

