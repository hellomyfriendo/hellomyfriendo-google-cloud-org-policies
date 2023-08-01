locals {
  org_policy_name_prefix = "organizations/${var.org_id}/policies"

  org_policy_parent = "organizations/${var.org_id}"
}

resource "google_org_policy_policy" "ainotebooks_restrictPublicIp" {
  name   = "${local.org_policy_name_prefix}/ainotebooks.restrictPublicIp"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "appengine_disableCodeDownload" {
  name   = "${local.org_policy_name_prefix}/appengine.disableCodeDownload"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "cloudfunctions_allowedIngressSettings" {
  name   = "${local.org_policy_name_prefix}/cloudfunctions.allowedIngressSettings"
  parent = local.org_policy_parent

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

resource "google_org_policy_policy" "compute_disableGlobalSelfManagedSslCertificate" {
  name   = "${local.org_policy_name_prefix}/compute.disableGlobalSelfManagedSslCertificate"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "commerceorggovernance_disablePublicMarketplace" {
  name   = "${local.org_policy_name_prefix}/commerceorggovernance.disablePublicMarketplace"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_disableGuestAttributesAccess" {
  name   = "${local.org_policy_name_prefix}/compute.disableGuestAttributesAccess"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_disableNonFIPSMachineTypes" {
  name   = "${local.org_policy_name_prefix}/compute.disableNonFIPSMachineTypes"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_disableSerialPortAccess" {
  name   = "${local.org_policy_name_prefix}/compute.disableSerialPortAccess"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_requireOsLogin" {
  name   = "${local.org_policy_name_prefix}/compute.requireOsLogin"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_requireShieldedVm" {
  name   = "${local.org_policy_name_prefix}/compute.requireShieldedVm"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_requireVpcFlowLogs" {
  name   = "${local.org_policy_name_prefix}/compute.requireVpcFlowLogs"
  parent = local.org_policy_parent

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
  name   = "${local.org_policy_name_prefix}/compute.restrictNonConfidentialComputing"
  parent = local.org_policy_parent

  spec {
    rules {
      deny_all = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_skipDefaultNetworkCreation" {
  name   = "${local.org_policy_name_prefix}/compute.skipDefaultNetworkCreation"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_vmCanIpForward" {
  name   = "${local.org_policy_name_prefix}/compute.vmCanIpForward"
  parent = local.org_policy_parent

  spec {
    rules {
      deny_all = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_vmExternalIpAccess" {
  name   = "${local.org_policy_name_prefix}/compute.vmExternalIpAccess"
  parent = local.org_policy_parent

  spec {
    rules {
      deny_all = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "gcp_detailedAuditLoggingMode" {
  name   = "${local.org_policy_name_prefix}/gcp.detailedAuditLoggingMode"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "gcp_resourceLocations" {
  name   = "${local.org_policy_name_prefix}/gcp.resourceLocations"
  parent = local.org_policy_parent

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

resource "google_org_policy_policy" "gcp_restrictNonCmekServices" {
  name   = "${local.org_policy_name_prefix}/gcp.restrictNonCmekServices"
  parent = local.org_policy_parent

  spec {
    rules {
      values {
        denied_values = [
          "aiplatform.googleapis.com",
          "artifactregistry.googleapis.com",
          "bigquery.googleapis.com",
          "bigtable.googleapis.com",
          "cloudfunctions.googleapis.com",
          "composer.googleapis.com",
          "compute.googleapis.com",
          "container.googleapis.com",
          "dataflow.googleapis.com",
          "dataproc.googleapis.com",
          "documentai.googleapis.com",
          "logging.googleapis.com",
          "pubsub.googleapis.com",
          "run.googleapis.com",
          "secretmanager.googleapis.com",
          "spanner.googleapis.com",
          "sqladmin.googleapis.com",
          "storage.googleapis.com",
        ]
      }
    }

    rules {
      values {
        allowed_values = [
          "storage.googleapis.com",
        ]
      }

      condition {
        expression = "resource.matchTag('projects', '${var.project_id}')"
      }
    }
  }
}

resource "google_org_policy_policy" "gcp_restrictTLSVersion" {
  name   = "${local.org_policy_name_prefix}/gcp.restrictTLSVersion"
  parent = local.org_policy_parent

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

resource "google_org_policy_policy" "iam_allowedPolicyMemberDomains" {
  name   = "${local.org_policy_name_prefix}/iam.allowedPolicyMemberDomains"
  parent = local.org_policy_parent

  spec {
    rules {
      values {
        allowed_values = var.allowed_policy_member_domains
      }
    }
  }
}

resource "google_org_policy_policy" "iam_automaticIamGrantsForDefaultServiceAccounts" {
  name   = "${local.org_policy_name_prefix}/iam.automaticIamGrantsForDefaultServiceAccounts"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "iam_disableAuditLoggingExemption" {
  name   = "${local.org_policy_name_prefix}/iam.disableAuditLoggingExemption"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "iam_disableServiceAccountKeyCreation" {
  name   = "${local.org_policy_name_prefix}/iam.disableServiceAccountKeyCreation"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "iam_disableServiceAccountKeyUpload" {
  name   = "${local.org_policy_name_prefix}/iam.disableServiceAccountKeyUpload"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "run_allowedIngress" {
  name   = "${local.org_policy_name_prefix}/run.allowedIngress"
  parent = local.org_policy_parent

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
  name   = "${local.org_policy_name_prefix}/sql.restrictPublicIp"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "storage_publicAccessPrevention" {
  name   = "${local.org_policy_name_prefix}/storage.publicAccessPrevention"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "storage_uniformBucketLevelAccess" {
  name   = "${local.org_policy_name_prefix}/storage.uniformBucketLevelAccess"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}