output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.subnets.public_subnet_id
}

output "private_subnet_id" {
  value = module.subnets.private_subnet_id
}

output "internet_gateway_id" {
  value = module.internet_gateway.internet_gateway_id
}

output "public_route_table_id" {
  value = module.route_table.public_route_table_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "webserver_instance_id" {
  value = module.instance.webserver_instance_id
}

output "webserver_instance_public_ip" {
  value = module.instance.webserver_instance_public_ip
}

