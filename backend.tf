terraform {
  backend "s3" {
    bucket         = "balaji-terraform-s3"
    key            = "aws-infra-automation/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}