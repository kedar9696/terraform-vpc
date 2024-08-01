# Create a elastic ip for nat gateway

resource "aws_eip" "nateip" {
  tags = {
    Name = "${var.name}-natEip"
  }
}

# Create a NAT GAteway for private subnet

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.nateip.id
  subnet_id     = var.public_subnet_id

  depends_on = [
    aws_eip.nateip
  ]
  tags = {
    Name = "${var.name}-natgw"
  }
}