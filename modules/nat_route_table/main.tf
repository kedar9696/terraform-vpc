# Create Route table for NAT Gateway

resource "aws_route_table" "natrt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "${var.name}-natrt"
  }
}

