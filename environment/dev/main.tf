module "vpc" {
  source    = "../../modules/vpc"
  cidr_block = var.main_cidr
  name       = "HDFC"
}

module "subnets" {
  source         = "../../modules/subnet"
  vpc_id         = module.vpc.vpc_id
  public_cidr    = var.public_cidr
  private_cidr   = var.private_cidr
  pub_sub_az     = var.pub_sub_az
  priv_sub_az    = var.priv_sub_az
  name           = "HDFC"
}

module "internet_gateway" {
  source   = "../../modules/internet_gateway"
  vpc_id   = module.vpc.vpc_id
  name     = "HDFC"
}

module "route_table" {
  source             = "../../modules/route_table"
  vpc_id             = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  public_subnet_id    = module.subnets.public_subnet_id
  name               = "HDFC"
}

module "security_group" {
  source         = "../../modules/security_group"
  vpc_id         = module.vpc.vpc_id
  ingress_ports  = [80, 443, 22, 0]
  name           = "HDFC"
}

module "instance" {
  source            = "../../modules/instance"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  security_group_id = module.security_group.security_group_id
  public_subnet_id  = module.subnets.public_subnet_id
  key_name          = var.key_name
  name              = "HDFC"
}
