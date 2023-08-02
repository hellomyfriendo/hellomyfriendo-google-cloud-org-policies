output "tfstate_bucket" {
  value = module.project.tfstate_bucket
}

output "tfstate_bucket_default_kms_key_name" {
  value = module.project.tfstate_bucket_default_kms_key_name
}

output "tfvars_secret" {
  value = google_secret_manager_secret.tfvars.secret_id
}
