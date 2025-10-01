module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.cidr_block
}

module "igw" {
  source = "./modules/Internet_getway"
  vpc_id = module.vpc.vpc_id
  
}

module "subnet" {
  source     = "./modules/subnet"
  vpc_id     = module.vpc.vpc_id
  cidr_block = var.cidr_block
  
}

module "route_table" {
  source    = "./modules/route_table"
  vpc_id    = module.vpc.vpc_id
  igw_id    = module.igw.igw_id
  subnet_id = module.subnet.subnet_id
}