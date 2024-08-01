resource "aws_instance" "server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [var.security_group_id]
  subnet_id       = var.subnet_id
  key_name        = var.key_name
  associate_public_ip_address = var.public_ip

  tags = {
    Name = var.name
  }
}

