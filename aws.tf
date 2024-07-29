# Terraform AWS Configuration

locals {
  name_env = "HDFC"
}

terraform {
  backend "s3" {
    bucket = "terraform-gra"
    key    = "gra/terraform.tfstate"  #name of the S3 object that will store the state file
    region = "ap-south-1"
    dynamodb_table = "terraform"
  }
}

# VPC Configuration

resource "aws_vpc" "terraform-vpc" {
  cidr_block = var.main_cidr
  tags = {
    Name = "${local.name_env}-vpc" # Assign a name tag to the VPC
  }
}

# Public Subnet Configuration

resource "aws_subnet" "terraform-pub-sub" {
  depends_on                                  = [aws_vpc.terraform-vpc]
  vpc_id                                      = aws_vpc.terraform-vpc.id
  cidr_block                                  = var.public_cidr
  availability_zone                           = var.pub_sub_az
  map_public_ip_on_launch                     = "true"
  enable_resource_name_dns_a_record_on_launch = "true"

  tags = {
    Name = "${local.name_env}-pub-sub" # Assign a name tag to the public subnet
  }
}

# Private Subnet Configuration

resource "aws_subnet" "terraform-priv-sub" {
  depends_on        = [aws_vpc.terraform-vpc]
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = var.private_cidr
  availability_zone = var.priv_sub_az

  tags = {
    Name = "${local.name_env}-priv-sub" # Assign a name tag to the private subnet
  }
}

# Internet Gateway Configuration

resource "aws_internet_gateway" "terraform-gw" {
  depends_on = [
    aws_vpc.terraform-vpc,
    aws_subnet.terraform-pub-sub,
    aws_subnet.terraform-priv-sub
  ]
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "${local.name_env}-gw" # Assign a name tag to the Internet Gateway
  }
}

# Route Table Configuration for Public Subnet

resource "aws_route_table" "terraform-pubrt" {
  depends_on = [
    aws_vpc.terraform-vpc,
    aws_internet_gateway.terraform-gw
  ]
  vpc_id = aws_vpc.terraform-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-gw.id
  }
  tags = {
    Name = "${local.name_env}-pubrt" # Assign a name tag to the public route table
  }
}

# Associate Public Subnet with Public Route Table

resource "aws_route_table_association" "pubrtassociation" {
  depends_on = [
    aws_vpc.terraform-vpc,
    aws_subnet.terraform-pub-sub,
    aws_subnet.terraform-priv-sub,
    aws_route_table.terraform-pubrt
  ]
  subnet_id      = aws_subnet.terraform-pub-sub.id
  route_table_id = aws_route_table.terraform-pubrt.id
}

# Creating a security group with ssh,http,https and icmp

resource "aws_security_group" "SG-1" {
  description = "HTTP,HTTPS,SSH,ICMP"
  name        = "${local.name_env}-SG-1"
  vpc_id      = aws_vpc.terraform-vpc.id

  # Created an inbound rule for webserver access!

  dynamic "ingress" {
    for_each = [80, 443, 22, 0]
    iterator = port
    content {
      description = "HTTP for webserver"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # Egress rule allowing all outbound traffic (0.0.0.0/0)

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # All protocols
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic 
  }
  tags = {
    Name = "${local.name_env}-SG-1"
  }
}

# Creating an AWS instance for the Webserver!

resource "aws_instance" "webserver" {
  depends_on = [
    aws_security_group.SG-1,
    aws_subnet.terraform-priv-sub,
    aws_subnet.terraform-pub-sub,
    aws_vpc.terraform-vpc,
    aws_route_table_association.pubrtassociation
  ]

  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.SG-1.id]
  subnet_id       = aws_subnet.terraform-pub-sub.id
  key_name        = var.key_name
  tags = {
    Name = "${local.name_env}-webserver"
  }
}

