output "project_id" {
  value = google_project.project.project_id
}

output "org_policy_admin_sa_email" {
  value = google_service_account.org_policy_admin.email
}

output "tfstate_bucket" {
  value = google_storage_bucket.tfstate.name
}
