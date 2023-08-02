locals {
  enable_apis = [
    "cloudbuild.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "orgpolicy.googleapis.com",
    "secretmanager.googleapis.com",
  ]

  gcs_sa_kms_roles = [
    "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  ]
}

data "google_storage_project_service_account" "gcs_sa" {
}

resource "google_project_service" "enable_apis" {
  for_each                   = toset(local.enable_apis)
  service                    = each.value
  disable_dependent_services = false
  disable_on_destroy         = false
}

# KMS
resource "google_kms_key_ring" "keyring" {
  name     = "keyring"
  location = var.region

  depends_on = [
    google_project_service.enable_apis
  ]
}

resource "google_kms_crypto_key" "tfstate_bucket" {
  name            = "tfstate-bucket-key"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "7776000s"

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_key_ring_iam_member" "gcs_sa" {
  for_each    = toset(local.gcs_sa_kms_roles)
  key_ring_id = google_kms_key_ring.keyring.id
  role        = each.value
  member      = "serviceAccount:${data.google_storage_project_service_account.gcs_sa.email_address}"
}

# Terraform state bucket
resource "random_pet" "tfstate_bucket" {
  length = 4
}

resource "google_storage_bucket" "tfstate" {
  name     = random_pet.tfstate_bucket.id
  location = var.region

  uniform_bucket_level_access = true

  encryption {
    default_kms_key_name = google_kms_crypto_key.tfstate_bucket.id
  }

  versioning {
    enabled = true
  }

  depends_on = [
    google_kms_key_ring_iam_member.gcs_sa
  ]
}