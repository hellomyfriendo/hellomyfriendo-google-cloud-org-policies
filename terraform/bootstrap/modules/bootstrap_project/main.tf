locals {
  enable_apis = [
    "cloudresourcemanager.googleapis.com",
    "orgpolicy.googleapis.com",
    "secretmanager.googleapis.com",
  ]
}

resource "google_project" "project" {
  name                = var.bootstrap_project_name
  project_id          = var.bootstrap_project_id
  org_id              = var.org_id
  billing_account     = var.bootstrap_billing_account
  auto_create_network = false
}

resource "google_project_service" "enable_apis" {
  for_each                   = toset(local.enable_apis)
  project                    = google_project.project.project_id
  service                    = each.value
  disable_dependent_services = false
  disable_on_destroy         = false
}

# Org Policy Service Account
resource "google_service_account" "org_policy_admin" {
  project      = google_project.project.project_id
  account_id   = "org-policy-admin"
  display_name = "Organization Policy Admin Service Account"
}

resource "google_organization_iam_member" "org_policy_admin_sa" {
  org_id = var.org_id
  role   = "roles/orgpolicy.policyAdmin"
  member = "serviceAccount:${google_service_account.org_policy_admin.email}"
}

resource "google_service_account_iam_member" "org_policy_admin_sa_token_creators" {
  for_each           = toset(var.org_admin_sa_token_creators)
  service_account_id = google_service_account.org_policy_admin.name
  role               = "roles/iam.serviceAccountTokenCreator"
  member             = "user:${each.value}"
}

# Terraform state bucket
resource "random_pet" "tfstate_bucket" {
  length = 4
}

resource "google_storage_bucket" "tfstate" {
  project       = google_project.project.project_id
  name          = random_pet.tfstate_bucket.id
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}