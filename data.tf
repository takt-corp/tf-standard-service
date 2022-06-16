data "google_project" "main" {
  project_id = var.project_id
}

data "google_storage_project_service_account" "gcs_account" {}

data "terraform_remote_state" "dns" {
  backend = "remote"

  config = {
    hostname     = "app.terraform.io"
    organization = "takt"

    workspaces = {
      name = "root-dns"
    }
  }
}

data "terraform_remote_state" "registry" {
  backend = "remote"

  config = {
    hostname     = "app.terraform.io"
    organization = "takt"

    workspaces = {
      name = "root-registry"
    }
  }
}

data "terraform_remote_state" "platform" {
  backend = "remote"

  config = {
    hostname     = "app.terraform.io"
    organization = "takt"

    workspaces = {
      name = "app-${var.environment}"
    }
  }
}
