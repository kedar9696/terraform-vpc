variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "ingress_ports" {
  description = "List of ingress ports"
  type        = list(number)
}

variable "name" {
  description = "Environment name"
  type        = string
}

