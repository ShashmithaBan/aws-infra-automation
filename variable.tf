variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  
}
variable "subnet_cidr" {
  description = "The CIDR block for the Subnet"
  type        = string
  
}
variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t2.micro"
  
}
variable "ssh_private_key" {
  type      = string
  sensitive = true
}
variable "ssh_public_key" {
  type      = string
  sensitive = true
}