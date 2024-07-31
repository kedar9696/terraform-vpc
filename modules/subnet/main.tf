resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_cidr
  availability_zone       = var.pub_sub_az
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-pub-sub"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_cidr
  availability_zone = var.priv_sub_az
  tags = {
    Name = "${var.name}-priv-sub"
  }
}

