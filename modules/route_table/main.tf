resource "aws_route_table" "rt" {
  vpc_id =var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "Terraform-Route-Table"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.rt.id
}