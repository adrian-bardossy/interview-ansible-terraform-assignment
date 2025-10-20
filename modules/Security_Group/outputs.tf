# SSH SG outputs
output "SSH_SG_name" {
  value = aws_security_group.ssh_only_my_ip_sg.name
}

output "SSH_SG_id" {
  value = aws_security_group.ssh_only_my_ip_sg.id
}
# ALB SG outputs
output "Alb_SG_name" {
  value = aws_security_group.alb_sg.name
}

output "Alb_SG_id" {
  value = aws_security_group.alb_sg.id
}

output "Nginx_SG_name" {
  value = aws_security_group.nginx_app_sg.name
}

output "Nginx_SG_id" {
  value = aws_security_group.nginx_app_sg.id
}