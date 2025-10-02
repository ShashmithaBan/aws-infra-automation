variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  
}
variable "igw_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}
variable "subnet_id" {
  description = "The ID of the Subnet"
  type        = string
}
variable "security_group_ids" {
  description = "The IDs of the Security Groups"
  type        = string
}
variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}
variable "instance_type" {      
  description = "The type of instance to use"
  type        = string
}