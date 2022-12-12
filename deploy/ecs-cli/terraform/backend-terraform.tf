terraform {
  required_providers {
    aws = {
      version = "~> 4.37.0"
    }
  }
}

provider "aws" {
  profile = "exploration"
  region  = "us-east-2"
}
