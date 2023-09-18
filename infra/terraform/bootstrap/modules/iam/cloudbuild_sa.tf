locals {
  cloudbuild_sa_email = "${data.google_project.project.number}@cloudbuild.gserviceaccount.com"

  cloudbuild_sa_org_roles = [
    "roles/compute.orgFirewallPolicyAdmin",
    "roles/orgpolicy.policyAdmin",
    "roles/resourcemanager.tagAdmin"
  ]
}

resource "google_organization_iam_member" "cloudbuild_sa" {
  for_each = toset(local.cloudbuild_sa_org_roles)
  org_id   = var.org_id
  role     = each.value
  member   = "serviceAccount:${local.cloudbuild_sa_email}"
}