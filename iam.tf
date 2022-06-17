resource "google_service_account" "main" {
  provider = google-beta

  account_id   = "${var.environment}-api-standard"
  display_name = "A service for the standard service container"
}

resource "google_project_iam_member" "signed_url_creator" {
  provider = google-beta

  project = var.project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:${google_service_account.main.email}"
}

resource "google_spanner_database_iam_member" "main" {
  provider = google-beta

  instance = data.terraform_remote_state.platform.outputs.spanner_instance_name
  database = data.terraform_remote_state.platform.outputs.spanner_database_name
  role     = "roles/spanner.databaseUser"
  member   = "serviceAccount:${google_service_account.main.email}"
}

resource "google_storage_bucket_iam_member" "main" {
  provider = google-beta

  bucket = data.terraform_remote_state.platform.outputs.bucket_name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.main.email}"
}

resource "google_service_account_iam_member" "main" {
  provider = google-beta

  service_account_id = google_service_account.main.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[api/standard]"
}
