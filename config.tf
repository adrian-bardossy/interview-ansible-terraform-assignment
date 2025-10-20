terraform {
  backend "s3" {
    bucket         = "terraform-interview-state-bucket"
    key            = "terraform/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-lock-state-file"
    encrypt        = true
  }
}
