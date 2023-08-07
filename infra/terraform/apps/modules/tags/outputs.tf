output "all_users_ingress_tag_key" {
  value = google_tags_tag_key.all_users_ingress.short_name
}

output "all_users_ingress_tag_value" {
  value = google_tags_tag_value.all_users_ingress.short_name
}