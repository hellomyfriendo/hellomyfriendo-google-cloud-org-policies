resource "google_cloudbuild_trigger" "apps" {
  name        = "apps"
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
