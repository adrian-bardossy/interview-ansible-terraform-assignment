output "private_key_pem" {
  value     = module.key-pair.private_key_pem
  sensitive = true
}

output "ec2_private_key_name" {
  value = module.key-pair.key_pair_name
}
