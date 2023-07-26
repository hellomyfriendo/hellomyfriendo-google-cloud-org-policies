output "org_policy_admin_sa_email" {
  value = module.bootstrap_project.org_policy_admin_sa_email
}

output "tfstate_bucket" {
  value = module.bootstrap_project.tfstate_bucket
}

output "tfvars_secret" {
  value = google_secret_manager_secret.tfvars.secret_id
}
