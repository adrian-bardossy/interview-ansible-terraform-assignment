output "ansible_eip_public_ip" {
  value = aws_eip.ansible_instance_eip.public_ip
}

output "nginx_private_ips" {
  value = [for i in aws_instance.nginx_instances : i.private_ip]
}
