resource "google_compute_firewall_policy" "default" {
  parent      = "organizations/${var.org_id}"
  short_name  = "default-firewall-policy"
  description = "Default Organization Hierarchical Firewall Policy. See https://cloud.google.com/architecture/landing-zones/implement-network-design#configure_hierarchical_firewall_policies."
}

resource "google_compute_firewall_policy_rule" "block_all_egress" {
  firewall_policy = google_compute_firewall_policy.default.name
  description     = "Block all egress traffic"
  priority        = 2100000000
  enable_logging  = true
  action          = "deny"
  direction       = "EGRESS"
  disabled        = false
  match {
    layer4_configs {
      ip_protocol = "all"
    }
    dest_ip_ranges = [
      "0.0.0.0/0"
    ]
    src_ip_ranges = [
      "0.0.0.0/0"
    ]
  }
}

resource "google_compute_firewall_policy_rule" "block_all_ingress" {
  firewall_policy = google_compute_firewall_policy.default.name
  description     = "Block all ingress traffic"
  priority        = 2099999999
  enable_logging  = true
  action          = "deny"
  direction       = "INGRESS"
  disabled        = false
  match {
    layer4_configs {
      ip_protocol = "all"
    }
    dest_ip_ranges = [
      "0.0.0.0/0"
    ]
    src_ip_ranges = [
      "0.0.0.0/0"
    ]
  }
}

resource "google_compute_firewall_policy_rule" "iap_for_tcp_forwarding_ingress" {
  firewall_policy = google_compute_firewall_policy.default.name
  description     = "Identity-Aware Proxy (IAP) for TCP forwardin."
  priority        = 2099999998
  enable_logging  = true
  action          = "allow"
  direction       = "INGRESS"
  disabled        = false
  match {
    layer4_configs {
      ip_protocol = "tcp"
      ports       = [22, 3389]
    }
    src_ip_ranges = [
      "35.235.240.0/20"
    ]
  }
}

resource "google_compute_firewall_policy_rule" "cloud_load_balancing_health_checks" {
  firewall_policy = google_compute_firewall_policy.default.name
  description     = "Health checks for Cloud Load Balancing"
  priority        = 2099999997
  enable_logging  = true
  action          = "allow"
  direction       = "INGRESS"
  disabled        = false
  match {
    layer4_configs {
      ip_protocol = "tcp"
      ports       = [80, 443]
    }
    src_ip_ranges = [
      "35.191.0.0/16",
      "130.211.0.0/22"
    ]
  }
}

resource "google_compute_firewall_policy_rule" "network_cloud_load_balancing_health_checks" {
  firewall_policy = google_compute_firewall_policy.default.name
  description     = "Health checks for Network Cloud Load Balancing"
  priority        = 2099999996
  enable_logging  = true
  action          = "allow"
  direction       = "INGRESS"
  disabled        = false
  match {
    layer4_configs {
      ip_protocol = "tcp"
      ports       = [80, 443]
    }
    src_ip_ranges = [
      "35.191.0.0/16",
      "209.85.152.0/22",
      "209.85.204.0/22"
    ]
  }
}