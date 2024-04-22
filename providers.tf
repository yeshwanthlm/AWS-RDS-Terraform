terraform {
  required_providers {
    aws = {
      version = "= 5.33.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}
