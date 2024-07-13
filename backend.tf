terraform {
  backend "s3" {
    bucket  = "terra-bucket-23"
    key     = "Go-pro/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}