output "project_id" {
  value = var.project_id
}

output "tfstate_bucket" {
  value = google_storage_bucket.tfstate.name
}

output "tfstate_bucket_default_kms_key_name" {
  value = google_kms_crypto_key.tfstate_bucket.id
}
