variable "region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Access key"
  type        = string
  sensitive   = true
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "Devops"
}

variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "key_name" {
  description = "Name of the SSH key pair for EC2 instances"
  type        = string
}

variable "main_cidr" {
  description = "The IPv4 CIDR block for the VPC"
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
