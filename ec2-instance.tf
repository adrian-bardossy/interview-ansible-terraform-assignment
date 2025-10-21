module "KP" {
  source            = "./modules/KP"
  instance_key_name = var.instance_key_name
}

module "Security_Group" {
  source = "./modules/Security_Group"
  vpc_id = module.VPC.vpc_id
}

module "ALB" {
  source               = "./modules/ALB"
  vpc_id               = module.VPC.vpc_id
  vpc_public_subnet_id = module.VPC.vpc_public_subnet_id
  alb_sg_id            = module.Security_Group.Alb_SG_id
  nginx_instance_ids   = module.EC2-instance.nginx_instance_ids


  depends_on = [
    module.EC2-instance,
    module.Security_Group
  ]
}


module "EC2-instance" {
  source                = "./modules/EC2-instance"
  instance_name         = var.instance_name
  KP_name               = module.KP.ec2_private_key_name
  security_group_id     = module.Security_Group.SSH_SG_id
  nginx_sg_id           = module.Security_Group.Nginx_SG_id
  vpc_public_subnet_id  = module.VPC.vpc_public_subnet_id[0]
  vpc_private_subnet_id = module.VPC.vpc_private_subnet_id[0]

  depends_on = [
    module.KP,
    module.Security_Group,
    module.VPC
  ]
}
module "VPC" {
  source   = "./modules/VPC"
  vpc_name = var.vpc_name
}
