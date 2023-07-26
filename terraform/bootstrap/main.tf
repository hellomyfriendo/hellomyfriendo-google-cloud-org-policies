module "bootstrap_project" {
  source = "./modules/bootstrap_project"

  org_id                      = var.org_id
  bootstrap_billing_account   = var.bootstrap_billing_account
  bootstrap_project_name      = var.bootstrap_project_name
  bootstrap_project_id        = var.bootstrap_project_id
  region                      = var.region
  org_admin_sa_token_creators = var.org_admin_sa_token_creators
}

# tfvars secret
resource "google_secret_manager_secret" "tfvars" {
  project   = module.bootstrap_project.project_id
  secret_id = "terraform-tfvars-bootstrap"

  replication {
    user_managed {
      replicas {
        location = var.region
      }
    }
  }
}

resource "google_secret_manager_secret_version" "tfvars" {
  secret      = google_secret_manager_secret.tfvars.id
  secret_data = file("${path.module}/terraform.tfvars")
}