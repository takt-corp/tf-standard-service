terraform {
  required_version = "~> 1.1.9"

  required_providers {
    google = {
      version = "~> 4.0.0"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "takt"

    workspaces {
      prefix = "standard-"
    }
  }
}

provider "google" {
  credentials = var.credentials
  project     = var.project_id
  region      = var.region
}

provider "google-beta" {
  credentials = var.credentials
  project     = var.project_id
  region      = var.region
}

data "google_client_config" "default" {}
