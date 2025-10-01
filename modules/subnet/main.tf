resource "aws_subnet" "subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Terraform-Subnet"
  }
}