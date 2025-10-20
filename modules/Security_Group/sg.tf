resource "aws_security_group" "ssh_only_my_ip_sg" {
  name        = local.ssh_only_my_ip_sg_name
  description = "SSH security group allowing only my IP"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH only from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public_ip]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = local.ssh_only_my_ip_sg_name
    description = "SSH security group for my IP only to access"
    deployedBy  = "Terraform"
    deployer    = "AdrianBardossy"
  }
}

resource "aws_security_group" "alb_sg" {
  name        = local.alb_http_https_sg_name
  description = "Allow HTTP and HTTPS from the Internet"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = local.alb_http_https_sg_name
    deployedBy = "Terraform"
    deployer   = "AdrianBardossy"
  }
}

resource "aws_security_group" "nginx_app_sg" {
  name        = local.nginx_app_sg_name
  description = "Allow HTTP from ALB and SSH from Ansible"
  vpc_id      = var.vpc_id

  # Allow HTTP from ALB
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    description     = "HTTP from ALB"
    security_groups = [aws_security_group.alb_sg.id]
  }

  # Allow SSH from the Ansible instance
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    description     = "SSH from Ansible instance"
    security_groups = [aws_security_group.ssh_only_my_ip_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = local.nginx_app_sg_name
    description = "NGINX SG for ALB and Ansible access"
    deployedBy  = "Terraform"
    deployer    = "AdrianBardossy"
  }
}
