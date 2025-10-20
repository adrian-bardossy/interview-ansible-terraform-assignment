resource "aws_lb" "nginx_alb" {
  name               = local.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.vpc_public_subnet_id

  enable_deletion_protection = false

  tags = {
    Name       = local.alb_name
    deployedBy = "Terraform"
    deployer   = "AdrianBardossy"
  }
}

# Target Group
resource "aws_lb_target_group" "nginx_tg" {
  name     = local.alb_target_group
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/phrase"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name       = local.alb_target_group
    deployedBy = "Terraform"
    deployer   = "AdrianBardossy"
  }
}

# Target group attachments for 3 NGINX instances
resource "aws_lb_target_group_attachment" "nginx_targets" {
  count            = 3
  target_group_arn = aws_lb_target_group.nginx_tg.arn
  target_id        = var.nginx_instance_ids[count.index]
  port             = 80
}

# ALB Listener (HTTP — we’ll add HTTPS later)
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.nginx_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx_tg.arn
  }
}

