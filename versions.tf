terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.27"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "trux-devops"
    key    = "GitHub_Actions/ghaRunnerStatefile/terraform.tfstate"
    region = "us-east-2"
    profile = "default"
  }
}
