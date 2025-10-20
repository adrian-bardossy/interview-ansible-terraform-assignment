# Terraform + Ansible AWS Infrastructure Assignment

## Overview
This project provisions a complete AWS environment using **Terraform** and automates deployments through **GitHub Actions**.  
It creates an Ansible bastion host and three NGINX servers behind an Application Load Balancer, using modular and reusable Terraform design.

---

## ⚙️ GitHub Actions CI/CD
The workflow file is located at:
- .github/workflows/terraform.yml - deploys terraform AWS infrastructure

### Pipeline Logic
| Branch Type | Actions Executed |
|--------------|------------------|
| **Feature / MR Branches** | `terraform fmt`, `validate`, `init`, and `plan` |
| **Main Branch (merged)** | Full deploy (`terraform apply`) |

### ☁️ Remote State Management
- Terraform state is stored in an **S3 bucket**.  
- **State locking** is managed by **DynamoDB**, ensuring safe concurrent runs.  
- AWS credentials are injected securely via GitHub repository secrets:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`

---

## Terraform Modules
The root module orchestrates several reusable submodules to deploy a production-ready environment.

### 1. EC2 Instance Module
- Deploys the latest **Ubuntu 24.04 LTS** via AMI data source.
- Creates a **public Ansible (bastion)** instance:
  - Assigned an **Elastic IP**
  - Installs **Ansible**
  - Allows SSH from your IP
- Creates **three private NGINX EC2 instances**:
  - No public IPs
  - NGINX pre-installed
  - Reachable from the Ansible instance and ALB only

### 2️. Application Load Balancer (ALB) Module
- Creates an **Application Load Balancer** across public subnets.
- Registers the three NGINX instances as **targets**.
- Enables:
  - **HTTP (port 80)** and **HTTPS (port 443)** listeners
  - **Health checks** for each NGINX node

### 3️. Key Pair (KP) Module
- Generates a new EC2 **Key Pair**.
- Stores the **private key** locally in the pipeline workspace for SSH access.

### 4️. Security Group Module
- Provisions three Security Groups:
  - **SSH SG:** Allows SSH from your public IP only (configured in `.auto.tfvars`)
  - **ALB SG:** Allows inbound HTTP/HTTPS from the Internet
  - **NGINX SG:** Allows inbound traffic from ALB and Ansible host
- All SGs allow outbound to `0.0.0.0/0`.

### 5️. VPC Module
- Creates a **dedicated VPC** with CIDR `10.0.0.0/16`
- Includes:
  - Public and private subnets
  - Internet Gateway
  - Route tables
  - Proper subnet associations

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ALB"></a> [ALB](#module\_ALB) | ./modules/ALB | n/a |
| <a name="module_EC2-instance"></a> [EC2-instance](#module\_EC2-instance) | ./modules/EC2-instance | n/a |
| <a name="module_KP"></a> [KP](#module\_KP) | ./modules/KP | n/a |
| <a name="module_Security_Group"></a> [Security\_Group](#module\_Security\_Group) | ./modules/Security_Group | n/a |
| <a name="module_VPC"></a> [VPC](#module\_VPC) | ./modules/VPC | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to deploy the resources into | `string` | n/a | yes |
| <a name="input_instance_key_name"></a> [instance\_key\_name](#input\_instance\_key\_name) | Name of the instance key pair | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the AWS instance | `string` | n/a | yes |
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | Your public IP to be able to access the EC2 instance | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ALB_SG_id"></a> [ALB\_SG\_id](#output\_ALB\_SG\_id) | n/a |
| <a name="output_Alb_SG_name"></a> [Alb\_SG\_name](#output\_Alb\_SG\_name) | ALB HTTPS SG outputs |
| <a name="output_Nginx_SG_id"></a> [Nginx\_SG\_id](#output\_Nginx\_SG\_id) | n/a |
| <a name="output_Nginx_SG_name"></a> [Nginx\_SG\_name](#output\_Nginx\_SG\_name) | n/a |
| <a name="output_SSH_SG_id"></a> [SSH\_SG\_id](#output\_SSH\_SG\_id) | n/a |
| <a name="output_SSH_SG_name"></a> [SSH\_SG\_name](#output\_SSH\_SG\_name) | Security groups |
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | ALB outputs |
| <a name="output_private_key_name"></a> [private\_key\_name](#output\_private\_key\_name) | KP outputs |

