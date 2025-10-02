terraform {
  backend "s3" {
    bucket = "shashmitha-terraform-bucket"
    key    = "shashmitha/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "shashmitha-terraform-lock-table"
  }
}
