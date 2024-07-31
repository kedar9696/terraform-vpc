output "webserver_instance_id" {
  description = "The ID of the webserver instance"
  value       = aws_instance.webserver.id
}

output "webserver_instance_public_ip" {
  description = "The public IP of the webserver instance"
  value       = aws_instance.webserver.public_ip
}

