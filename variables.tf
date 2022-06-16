variable "environment" {
  type        = string
  description = "The name of the application environment. Values: alpha, beta, production"
}

variable "project_id" {
  type        = string
  description = "The Google Cloud project ID to deploy the resources."
}

variable "credentials" {
  type        = string
  description = "The Google Cloud service account credentials used to authenticate."
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "The Google Cloud region to deploy the resources."
}
