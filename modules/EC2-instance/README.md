## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.ansible_instance_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip_association.ubuntu_eip_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) | resource |
| [aws_instance.ansible_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.nginx_instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.ubuntu_24](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_KP_name"></a> [KP\_name](#input\_KP\_name) | n/a | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | n/a | `string` | n/a | yes |
| <a name="input_nginx_sg_id"></a> [nginx\_sg\_id](#input\_nginx\_sg\_id) | Security Group ID to attach to the NGINX instances | `string` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | n/a | `string` | n/a | yes |
| <a name="input_vpc_private_subnet_id"></a> [vpc\_private\_subnet\_id](#input\_vpc\_private\_subnet\_id) | Private subnet ID | `string` | n/a | yes |
| <a name="input_vpc_public_subnet_id"></a> [vpc\_public\_subnet\_id](#input\_vpc\_public\_subnet\_id) | Public subnet ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ansible_eip_public_ip"></a> [ansible\_eip\_public\_ip](#output\_ansible\_eip\_public\_ip) | n/a |
| <a name="output_nginx_private_ips"></a> [nginx\_private\_ips](#output\_nginx\_private\_ips) | n/a |
