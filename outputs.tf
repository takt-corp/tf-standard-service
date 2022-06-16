output "service_account" {
  value       = google_service_account.main.name
  description = "The name of the service account used for the standard service."
}
