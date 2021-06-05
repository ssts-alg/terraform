provider "aws" {
  region = var.region_name
}


terraform {
  backend "s3" {
    bucket         = "sureshbabu-test-123"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform"
  }
}
