terraform {
  backend "s3" {
    bucket = var.s3_bucket_name
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = var.dynamodb_table_name
  }
}
