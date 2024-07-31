resource "aws_instance" "webserver" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [var.security_group_id]
  subnet_id       = var.public_subnet_id
  key_name        = var.key_name

  tags = {
    Name = "${var.name}-webserver"
  }
}

