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
  cidr_block = var.subnet_cidr
  
}

module "route_table" {
  source    = "./modules/route_table"
  vpc_id    = module.vpc.vpc_id
  igw_id    = module.igw.igw_id
  subnet_id = module.subnet.subnet_id
}

module "sg" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id
  subnet_id = module.subnet.subnet_id
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id             = module.vpc.vpc_id
  igw_id             = module.igw.igw_id
  subnet_id         = module.subnet.subnet_id
  security_group_ids = module.sg.sg_id
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  ssh_private_key   = var.ssh_private_key
  ssh_public_key    = var.ssh_public_key

}