provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket            = "terraform-s3-eks-state"
    key              	= "state/terraform.tfstate"
    region         	  = "ap-southeast-1"
    encrypt        	  = true
    dynamodb_table    = "terraform-s3-eks-state-lock"    
  }
}
