# SSH SG outputs
output "SSH_SG_name" {
  value = module.ssh_only_my_ip_sg.security_group_name
}

output "SSH_SG_arn" {
  value = module.ssh_only_my_ip_sg.security_group_arn
}

output "SSH_SG_id" {
  value = module.ssh_only_my_ip_sg.security_group_id
}

# ALB SG outputs
output "Alb_SG_name" {
  value = module.alb_http_https_sg.security_group_name
}

output "Alb_SG_arn" {
  value = module.alb_http_https_sg.security_group_arn
}

output "Alb_SG_id" {
  value = module.alb_http_https_sg.security_group_id
}

# NGINX SG outputs
output "Nginx_SG_name" {
  value = module.nginx_app_sg.security_group_name
}

output "Nginx_SG_arn" {
  value = module.nginx_app_sg.security_group_arn
}

output "Nginx_SG_id" {
  value = module.nginx_app_sg.security_group_id
}