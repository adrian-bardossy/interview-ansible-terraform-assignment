module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.1"

  name                 = var.vpc_name
  cidr                 = local.vpc_subnet
  azs                  = local.azs
  public_subnets       = local.public_subnets
  private_subnets      = local.private_subnets
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_nat_gateway   = false
  tags = {
    deployedBy = "terraform"
    deploter   = "AdrianBardossy"
  }
}

# Adding VPC routing to provate subnet
resource "aws_route" "private_allow_internal" {
  for_each = toset(module.vpc.private_route_table_ids)

  route_table_id         = each.value
  destination_cidr_block = local.vpc_subnet
  gateway_id             = local.local_gateway
}
