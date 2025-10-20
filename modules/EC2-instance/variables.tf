variable "instance_name" {
  type = string
}

variable "KP_name" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "vpc_public_subnet_id" {
  description = "Public subnet ID"
  type        = string
}

variable "vpc_private_subnet_id" {
  description = "Private subnet ID"
  type        = string
}

variable "nginx_sg_id" {
  description = "Security Group ID to attach to the NGINX instances"
  type        = string
}
