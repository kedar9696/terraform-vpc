# AWS Provider Configuration

provider "aws" {
  region = var.region # Specify the AWS region
  access_key = var.accesskey
  secret_key = var.secretaccesskey
}
