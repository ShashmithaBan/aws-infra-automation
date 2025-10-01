module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.cidr_block
}

module "subnet" {
  source     = "./modules/subnet"
  vpc_id     = module.vpc.vpc_id
  cidr_block = var.cidr_block
  
}