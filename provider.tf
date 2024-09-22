/* terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}*/

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

  s3_use_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

endpoints {
    #iam            = "http://localhost:4566"
    #kinesis        = "http://localhost:4566"
    #lambda         = "http://localhost:4566"
    ec2            = "http://localhost:4566"
  }
}