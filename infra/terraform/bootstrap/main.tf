module "project" {
  source = "./modules/project"

  project_id = var.project_id
  region     = var.region
}

module "apps" {
  source = "./modules/apps"

  org_id                        = var.org_id
  project_id                    = var.project_id
  region                        = var.region
  allowed_policy_member_domains = var.allowed_policy_member_domains
  sourcerepo_name               = var.sourcerepo_name
  branch_name                   = var.branch_name
  tfstate_bucket                = module.project.tfstate_bucket
}

# tfvars secret
resource "google_secret_manager_secret" "tfvars" {
  project   = module.project.project_id
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