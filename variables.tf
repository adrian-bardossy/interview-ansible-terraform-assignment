variable "aws_region" {
  type        = string
  description = "AWS region to deploy the resources into"
}

# KP module vaiables
variable "instance_key_name" {
  type        = string
  description = "Name of the instance key pair"
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
