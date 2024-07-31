variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "public_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "pub_sub_az" {
  description = "Availability zone for the public subnet"
  type        = string
}

variable "priv_sub_az" {
  description = "Availability zone for the private subnet"
  type        = string
}

variable "name" {
  description = "Environment name"
  type        = string
}

