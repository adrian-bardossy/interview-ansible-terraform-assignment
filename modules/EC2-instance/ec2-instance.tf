data "aws_ami" "ubuntu_22" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
    # values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
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


resource "aws_eip" "ubuntu_eip" {
  domain = "vpc"
}

resource "aws_eip_association" "ubuntu_eip_association" {
  instance_id   = aws_instance.ubuntu_instance.id
  allocation_id = aws_eip.ubuntu_eip.id
}

resource "aws_instance" "ubuntu_instance" {
  ami                         = data.aws_ami.ubuntu_22.id
  instance_type               = local.instance_type
  subnet_id                   = var.vpc_subnet
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.KP_name
  associate_public_ip_address = false

  user_data = file("${path.module}/input_server_data.sh")

  tags = {
    Name       = var.instance_name
    managed_by = "Terraform"
    deployedBy = "Terraform"
    deployer   = "AdrianBardossy"
  }
}
