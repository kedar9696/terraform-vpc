variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "internet_gateway_id" {
  description = "The Internet Gateway ID"
  type        = string
}

variable "public_subnet_id" {
  description = "The public subnet ID"
  type        = string
}

variable "name" {
  description = "Environment name"
  type        = string
}

