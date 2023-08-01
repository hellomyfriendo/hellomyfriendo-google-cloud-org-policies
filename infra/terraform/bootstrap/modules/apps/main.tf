locals {
  cloudbuild_sa_email = "${data.google_project.project.number}@cloudbuild.gserviceaccount.com"

  cloudbuild_sa_org_roles = [
    "roles/orgpolicy.policyAdmin",
  ]
}

data "google_project" "project" {
  project_id = var.project_id
}

resource "google_organization_iam_member" "cloudbuild_sa" {
  for_each = toset(local.cloudbuild_sa_org_roles)
  org_id   = var.org_id
  role     = each.value
  member   = "serviceAccount:${local.cloudbuild_sa_email}"
}

resource "google_cloudbuild_trigger" "apps" {
  project = var.project_id
  name    = "apps"

  description = "Build and deploy the apps"

  trigger_template {
    repo_name   = var.sourcerepo_name
    branch_name = var.branch_name
  }

  filename = "infra/cloudbuild/apps/cloudbuild.yaml"

  substitutions = {
    _TFSTATE_BUCKET                = var.tfstate_bucket
    _ORG_ID                        = var.org_id
    _REGION                        = var.region
    _ALLOWED_POLICY_MEMBER_DOMAINS = join(",", var.allowed_policy_member_domains)
  }
}
