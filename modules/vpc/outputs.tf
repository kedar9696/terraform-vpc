output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "default_route_table_id" {
  value = aws_vpc.this.default_route_table_id
}

output "main_route_table_id" {
  value = aws_vpc.this.main_route_table_id
}