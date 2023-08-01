locals {
  enable_apis = [
    "cloudbuild.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "orgpolicy.googleapis.com",
    "secretmanager.googleapis.com",
  ]
}

data "google_project" "project" {
  project_id = var.project_id
}

resource "google_project_service" "enable_apis" {
  for_each                   = toset(local.enable_apis)
  project                    = data.google_project.project.project_id
  service                    = each.value
  disable_dependent_services = false
  disable_on_destroy         = false
}

# Terraform state bucket
resource "random_pet" "tfstate_bucket" {
  length = 4
}

resource "google_storage_bucket" "tfstate" {
  project       = data.google_project.project.project_id
  name          = random_pet.tfstate_bucket.id
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}