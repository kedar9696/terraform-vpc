output "nat_gateway_id" {
  description = "The ID of the public route table"
  value       = aws_nat_gateway.natgw.id
}

output "elastic_ip" {
  value = aws_eip.nateip.public_ip
}