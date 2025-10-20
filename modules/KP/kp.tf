module "key-pair" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = "2.0.3"

  key_name              = var.instance_key_name
  create_private_key    = true
  private_key_algorithm = "RSA"
  private_key_rsa_bits  = 4096
  tags = {
    name       = "${local.pem_key_name}"
    DeployedBy = "Terraform"
    Deployer   = "AdrianBardossy"
  }
}

resource "local_file" "KP_pem_key" {
  content         = module.key-pair.private_key_pem
  filename        = "${path.root}/${local.pem_key_name}.pem"
  file_permission = "0400"
}
