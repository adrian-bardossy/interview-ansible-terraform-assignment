module "ssh_only_my_ip_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "5.2.0"

  name                = local.ssh_only_my_ip_sg_name
  description         = "SSH security group allowing only my IP"
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = [var.public_ip]
  ingress_rules       = ["ssh-tcp"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]

  tags = {
    name        = local.ssh_only_my_ip_sg_name
    description = "SSH security group for my IP only"
    deployedBy  = "Terraform"
    deployer    = "AdrianBardossy"
  }
}
