# KP outputs
output "private_key_name" {
  value = module.KP.ec2_private_key_name
}

# Security groups
output "my_ip_ssh_name" {
  value = module.Security_Group.my_ip_ssh_name
}

output "my_ip_ssh_arn" {
  value = module.Security_Group.my_ip_ssh_arn
}

output "my_ip_ssh_id" {
  value = module.Security_Group.my_ip_ssh_id
}

output "Alb_SG_name" {
  value = module.Security_Group.Alb_SG_name
}

output "Alb_SG_arn" {
  value = module.Security_Group.Alb_SG_arn
}

output "Alb_SG_id" {
  value = module.Security_Group.Alb_SG_id
}

output "Nginx_SG_name" {
  value = module.Security_Group.Nginx_SG_name
}

output "Nginx_SG_arn" {
  value = module.Security_Group.Nginx_SG_arn
}

output "Nginx_SG_id" {
  value = module.Security_Group.Nginx_SG_id
}



output "public_ip" {
  value = module.EC2-instance.ubuntu_eip_public_ip
}
