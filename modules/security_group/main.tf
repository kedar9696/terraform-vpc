resource "aws_security_group" "this" {
  name = var.name
  description = "Security Group for the ${var.name} vpc"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_ports
    iterator = port
    content {
      description = "ingress rules"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["114.143.179.2/32"]
    }
  }

  egress {
    description = "egress rules"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-SG"
  }
}

