variable "region" {
  description = "AWS region where resources will be created"
  type        = string  
  default     = "ap-south-1" # Default to a specific region
}

variable "ami_id" {
  description = "ID of the AMI to use for instances"
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
}

variable "key_name" {
  description = "Name of the SSH key pair for EC2 instances"
}

variable "main_cidr" {
  description = "CIDR block for the VPC"
}

variable "public_cidr" {
  description = "CIDR block for the public subnet"
}

variable "private_cidr" {
  description = "CIDR block for the private subnet"
}

variable "pub_sub_az" {
  description = "Availability zone for the public subnet"
}

variable "priv_sub_az" {
  description = "Availability zone for the private subnet"
}
