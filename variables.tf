variable "aws_region" {
  type        = string
  description = "AWS region to deploy the resources into"
}

# KP module vaiables
variable "instance_key_name" {
  type        = string
  description = "Name of the instance key pair"
}

# SG module vars
variable "public_ip" {
  type        = string
  description = "Your public IP to be able to access the EC2 instance"
}

# EC2
variable "instance_name" {
  type        = string
  description = "Name of the AWS instance"
}

#VPC
variable "vpc_name" {
  type = string
}
