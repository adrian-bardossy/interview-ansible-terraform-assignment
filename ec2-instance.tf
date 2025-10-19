module "KP" {
  source            = "./modules/KP"
  instance_key_name = var.instance_key_name
}

module "Security_Group" {
  source    = "./modules/Security_Group"
  public_ip = var.public_ip
  vpc_id    = module.VPC.vpc_id
}

module "EC2-instance" {
  source            = "./modules/EC2-instance"
  instance_name     = var.instance_name
  KP_name           = module.KP.ec2_private_key_name
  security_group_id = module.Security_Group.my_ip_ssh_id
  depends_on = [
    module.KP,
    module.Security_Group
  ]
  vpc_subnet = module.VPC.vpc_public_subnet_id[0]
}

module "VPC" {
  source   = "./modules/VPC"
  vpc_name = var.vpc_name
}
