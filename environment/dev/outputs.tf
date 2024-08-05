output "vpc_id" {
  value = module.vpc.vpc_id
}

output "default_route_table_id" {
  value = module.vpc.default_route_table_id
}

output "main_route_table_id" {
  value = module.vpc.main_route_table_id
}

output "public_subnet_id" {
  value = module.subnet.public_subnet_id
}

output "private_subnet_id" {
  value = module.subnet.private_subnet_id
}

output "internet_gateway_id" {
  value = module.internet_gateway.internet_gateway_id
}

output "public_route_table_id" {
  value = module.igw_route_table.public_route_table_id
}

output "nat_gateway_id" {
  value = module.nat_gateway.nat_gateway_id
}

output "elastic_ip" {
  value = module.nat_gateway.elastic_ip
}

output "nat_route_table_id" {
  value = module.nat_route_table.nat_route_table_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "webserver_instance_name" {
  value = module.webserver_instance.instance_name
}
output "webserver_instance_id" {
  value = module.webserver_instance.instance_id
}

output "webserver_instance_public_ip" {
  value = module.webserver_instance.instance_public_ip
}

output "Dbserver_instance_name" {
  value = module.Dbserver_instance.instance_name
}

output "Dbserver_instance_id" {
  value = module.Dbserver_instance.instance_id
}
output "Dbserver_instance_private_ip" {
  value = module.Dbserver_instance.instance_private_ip
}