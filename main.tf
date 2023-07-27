terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.9"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

module "iam" {
  source = "./modules/iam"
}
