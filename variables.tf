variable "aws_region" {
  default = "us-east-1"
}

variable "state_bucket_name" {
  default = "terraform-state-bucket-20251108-unique"
}

variable "dynamodb_table_name" {
  default = "terraform-locks"
}
