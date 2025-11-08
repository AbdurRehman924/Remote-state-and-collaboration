terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-20251108-unique"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
