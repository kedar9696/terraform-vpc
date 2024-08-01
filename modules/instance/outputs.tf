output "instance_id" {
  description = "The ID of the webserver instance"
  value       = aws_instance.server.id
}

output "instance_public_ip" {
  description = "The public IP of the webserver instance"
  value       = aws_instance.server.public_ip
}

output "instance_name" {
  value = aws_instance.server.tags.Name
}

output "instance_private_ip" {
  value = aws_instance.server.private_ip
}
