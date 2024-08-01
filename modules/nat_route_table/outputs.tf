output "nat_route_table_id" {
  description = "The ID of the NAT route table"
  value       = aws_route_table.natrt.id
}

