output "alb_dns_name" {
  value       = aws_lb.nginx_alb.dns_name
  description = "Public DNS name of the ALB"
}
