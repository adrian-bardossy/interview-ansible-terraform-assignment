variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "vpc_public_subnet_id" {
  description = "Public subnet ID for the ALB"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "nginx_instance_ids" {
  description = "List of NGINX instance IDs to attach to target group"
  type        = list(string)
}
