data "aws_ami" "ubuntu_24" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_eip" "ansible_instance_eip" {
  domain = "vpc"
}

resource "aws_eip_association" "ubuntu_eip_association" {
  instance_id   = aws_instance.ansible_instance.id
  allocation_id = aws_eip.ansible_instance_eip.id
}

resource "aws_instance" "ansible_instance" {
  ami                         = data.aws_ami.ubuntu_24.id
  instance_type               = local.instance_type
  subnet_id                   = var.vpc_public_subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.KP_name
  associate_public_ip_address = false

  user_data = file("${path.module}/ansibe_instance_data.sh")

  tags = {
    Name       = var.instance_name
    managed_by = "Terraform"
    deployedBy = "Terraform"
    deployer   = "AdrianBardossy"
  }
}

resource "aws_instance" "nginx_instances" {
  count                       = 3
  ami                         = data.aws_ami.ubuntu_24.id
  instance_type               = "t3.micro"
  subnet_id                   = var.vpc_private_subnet_id
  vpc_security_group_ids      = [var.nginx_sg_id]
  key_name                    = var.KP_name
  associate_public_ip_address = false
  user_data                   = file("${path.module}/nginx_instance_data.sh")

  tags = {
    Name       = "nginx-${count.index + 1}"
    managed_by = "Terraform"
    deployer   = "AdrianBardossy"
  }
}
