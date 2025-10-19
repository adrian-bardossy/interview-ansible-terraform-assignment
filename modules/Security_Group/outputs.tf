output "my_ip_ssh_name" {
  value = module.ssh_only_my_ip_sg.security_group_name
}

output "my_ip_ssh_arn" {
  value = module.ssh_only_my_ip_sg.security_group_arn
}

output "my_ip_ssh_id" {
  value = module.ssh_only_my_ip_sg.security_group_id
}
