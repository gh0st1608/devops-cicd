terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

 endpoints {
    dynamodb = var.service == "localstack" ? "http://localhost:4566" : null
    s3       = var.service == "localstack" ? "http://localhost:4566" : null
    ssm      = var.service == "localstack" ? "http://localhost:4566" : null
  }

  # Opciones adicionales para LocalStack
  s3_use_path_style         = var.service == "localstack" ? true : false
  skip_credentials_validation = var.service == "localstack" ? true : false
  skip_metadata_api_check     = var.service == "localstack" ? true : false
  skip_requesting_account_id  = var.service == "localstack" ? true : false
}