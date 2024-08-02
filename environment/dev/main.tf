module "vpc" {
  source             = "../../modules/vpc"
  cidr_block         = var.main_cidr
  enable_dns_support = var.enable_dns_support
  name               = var.name
}

module "subnets" {
  source       = "../../modules/subnet"
  vpc_id       = module.vpc.vpc_id
  public_cidr  = var.public_cidr
  private_cidr = var.private_cidr
  pub_sub_az   = var.pub_sub_az
  priv_sub_az  = var.priv_sub_az
  name         = var.name
}

module "internet_gateway" {
  source = "../../modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
  name   = var.name
}

module "igw_route_table" {
  source              = "../../modules/route_table"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  #public_subnet_id    = module.subnets.public_subnet_id
  name = var.name
}

# Associate Public Subnet with igw Route Table

resource "aws_route_table_association" "public" {
  subnet_id      = module.subnets.public_subnet_id
  route_table_id = module.igw_route_table.public_route_table_id
}

module "nat_gateway" {
  source           = "../../modules/nat_gateway"
  public_subnet_id = module.subnets.public_subnet_id
  name             = var.name
}

module "nat_route_table" {
  source         = "../../modules/nat_route_table"
  vpc_id         = module.vpc.vpc_id
  nat_gateway_id = module.nat_gateway.nat_gateway_id
  name           = var.name
}

# Associating the NAT Route table for NAT Gateway to Public Subnet!

resource "aws_route_table_association" "natrtassociation" {
  subnet_id      = module.subnets.private_subnet_id
  route_table_id = module.nat_route_table.nat_route_table_id
}

module "security_group" {
  source        = "../../modules/security_group"
  vpc_id        = module.vpc.vpc_id
  ingress_ports = [80, 443, 22, 0]
  name          = var.name
}

# Webserver Instance
module "webserver_instance" {
  source            = "../../modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  security_group_id = module.security_group.security_group_id
  subnet_id         = module.subnets.public_subnet_id
  key_name          = var.key_name
  public_ip         = true
  name              = "${var.name}-Webserver"
}

# DBserver Instance
module "Dbserver_instance" {
  source            = "../../modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  security_group_id = module.security_group.security_group_id
  subnet_id         = module.subnets.private_subnet_id
  key_name          = var.key_name
  public_ip         = false
  name              = "${var.name}-DBserver"
}