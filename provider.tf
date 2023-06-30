terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "products-info-l2"
    key    = "ram-tfstate"
    region = "ap-southeast-2"
  }
}


provider "aws" {
  region = "us-east-2"
#   access_key = "my-access-key"
#   secret_key = "my-secret-key"
}