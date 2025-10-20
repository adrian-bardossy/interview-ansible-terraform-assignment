module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.1"

  name                 = var.vpc_name
  cidr                 = local.vpc_subnet
  azs                  = local.azs
  public_subnets       = local.public_subnets
  private_subnets      = local.private_subnets
  enable_dns_hostnames = true
  enable_nat_gateway   = false
  tags = {
    deployedBy = "terraform"
    deploter   = "AdrianBardossy"
  }
}
