variable "ami_id" {
  description = "ID of the AMI to use for instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
}

variable "security_group_id" {
  description = "The Security Group ID"
  type        = string
}

variable "public_subnet_id" {
  description = "The public subnet ID"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair for EC2 instances"
  type        = string
}

variable "name" {
  description = "Environment name"
  type        = string
}

