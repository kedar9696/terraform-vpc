# Output Region name

output "region" {
  value = var.region
}

# Output webserver instance AMI ID

output "webserver_instance_ami_is" {
  value = aws_instance.webserver.ami
}

# Output webserver instance public ip

output "webserver_instance_public_ip_is" {
  value = aws_instance.webserver.public_ip
}

# Output VPC ID
output "vpc_id" {
  value = aws_vpc.terraform-vpc.id
}

# Output Public Subnet ID
output "public_subnet_id" {
  value = aws_subnet.terraform-pub-sub.id
}

# Output Private Subnet ID
output "private_subnet_id" {
  value = aws_subnet.terraform-priv-sub.id
}

# Output Internet Gateway ID
output "internet_gateway_id" {
  value = aws_internet_gateway.terraform-gw.id
}

# Output Public Route Table ID
output "public_route_table_id" {
  value = aws_route_table.terraform-pubrt.id
}

# Output Security Group ID
output "security_group_id" {
  value = aws_security_group.SG-1.id
}

# Output Webserver Instance ID
output "webserver_instance_id" {
  value = aws_instance.webserver.id
}
