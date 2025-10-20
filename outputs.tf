# KP outputs
output "private_key_name" {
  value = module.KP.ec2_private_key_name
}

# Security groups
output "SSH_SG_name" {
  value = module.Security_Group.SSH_SG_name
}

output "SSH_SG_id" {
  value = module.Security_Group.SSH_SG_id
}

# ALB HTTPS SG outputs
output "Alb_SG_name" {
  value = module.Security_Group.Alb_SG_name
}

output "ALB_SG_id" {
  value = module.Security_Group.Alb_SG_id
}


output "Nginx_SG_name" {
  value = module.Security_Group.Nginx_SG_name
}

output "Nginx_SG_id" {
  value = module.Security_Group.Nginx_SG_id
}

# ALB outputs
output "alb_dns_name" {
  value = module.ALB.alb_dns_name
}

output "public_ip" {
  value = module.EC2-instance.ansible_eip_public_ip
}
