output "vpc_name" {
  value = module.vpc.name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_public_subnet_id" {
  value = module.vpc.public_subnets
}

output "vpc_private_subnet_id" {
  value = module.vpc.private_subnets
}