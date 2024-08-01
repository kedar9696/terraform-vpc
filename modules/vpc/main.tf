resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  enable_dns_support  = var.enable_dns_support
  tags = {
    Name = "${var.name}-vpc"
  }
}

