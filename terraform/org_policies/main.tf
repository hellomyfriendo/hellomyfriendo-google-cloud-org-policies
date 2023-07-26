locals {
  org_policy_name_prefix = "organizations/${var.org_id}/policies"

  org_policy_parent = "organizations/${var.org_id}"
}

provider "google" {
  project = var.bootstrap_project_id
  region  = var.region
}

provider "google" {
  alias        = "org-policy-admin"
  project      = var.bootstrap_project_id
  region       = var.region
  access_token = data.google_service_account_access_token.default.access_token
}

data "google_service_account_access_token" "default" {
  target_service_account = var.org_policy_admin_sa_email
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "300s"
}

resource "google_org_policy_policy" "appengine_disableCodeDownload" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/appengine.disableCodeDownload"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "cloudfunctions_allowedIngressSettings" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/cloudfunctions.allowedIngressSettings"
  parent   = local.org_policy_parent

  spec {
    rules {
      values {
        allowed_values = [
          "ALLOW_INTERNAL_AND_GCLB",
        "ALLOW_INTERNAL_ONLY"]
      }
    }
  }
}

resource "google_org_policy_policy" "compute_disableGlobalLoadBalancing" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/compute.disableGlobalLoadBalancing"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_disableGlobalSelfManagedSslCertificate" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/compute.disableGlobalSelfManagedSslCertificate"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_disableGuestAttributesAccess" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/compute.disableGuestAttributesAccess"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_disableNonFIPSMachineTypes" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/compute.disableNonFIPSMachineTypes"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_disableSerialPortAccess" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/compute.disableSerialPortAccess"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_requireOsLogin" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/compute.requireOsLogin"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_requireShieldedVm" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/compute.requireShieldedVm"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_requireVpcFlowLogs" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/compute.requireVpcFlowLogs"
  parent   = local.org_policy_parent

  spec {
    rules {
      values {
        allowed_values = [
          "COMPREHENSIVE"
        ]
      }
    }
  }
}

resource "google_org_policy_policy" "compute_restrictNonConfidentialComputing" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/compute.restrictNonConfidentialComputing"
  parent   = local.org_policy_parent

  spec {
    rules {
      deny_all = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_skipDefaultNetworkCreation" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/compute.skipDefaultNetworkCreation"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_vmCanIpForward" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/compute.vmCanIpForward"
  parent   = local.org_policy_parent

  spec {
    rules {
      deny_all = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_vmExternalIpAccess" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/compute.vmExternalIpAccess"
  parent   = local.org_policy_parent

  spec {
    rules {
      deny_all = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "gcp_detailedAuditLoggingMode" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/gcp.detailedAuditLoggingMode"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "gcp_resourceLocations" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/gcp.resourceLocations"
  parent   = local.org_policy_parent

  spec {
    rules {
      values {
        allowed_values = [
          "in:canada-locations",
        ]
      }
    }
  }
}

resource "google_org_policy_policy" "gcp_restrictTLSVersion" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/gcp.restrictTLSVersion"
  parent   = local.org_policy_parent

  spec {
    rules {
      values {
        denied_values = [
          "TLS_VERSION_1",
          "TLS_VERSION_1_1"
        ]
      }
    }
  }
}

resource "google_org_policy_policy" "iam_automaticIamGrantsForDefaultServiceAccounts" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/iam.automaticIamGrantsForDefaultServiceAccounts"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "iam_disableAuditLoggingExemption" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/iam.disableAuditLoggingExemption"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "iam_disableServiceAccountKeyCreation" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/iam.disableServiceAccountKeyCreation"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "iam_disableServiceAccountKeyUpload" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/iam.disableServiceAccountKeyUpload"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "run_allowedIngress" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/run.allowedIngress"
  parent   = local.org_policy_parent

  spec {
    rules {
      values {
        allowed_values = [
          "internal",
          "internal-and-cloud-load-balancing"
        ]
      }
    }
  }
}

resource "google_org_policy_policy" "sql_restrictPublicIp" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/sql.restrictPublicIp"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "storage_publicAccessPrevention" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/storage.publicAccessPrevention"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "storage_uniformBucketLevelAccess" {
  provider = google.org-policy-admin
  name     = "${local.org_policy_name_prefix}/storage.uniformBucketLevelAccess"
  parent   = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

# tfvars secret
resource "google_secret_manager_secret" "tfvars" {
  secret_id = "terraform-tfvars-org-policies"

  replication {
    user_managed {
      replicas {
        location = var.region
      }
    }
  }
}

resource "google_secret_manager_secret_version" "tfvars" {
  provider    = google
  secret      = google_secret_manager_secret.tfvars.id
  secret_data = file("${path.module}/terraform.tfvars")
}