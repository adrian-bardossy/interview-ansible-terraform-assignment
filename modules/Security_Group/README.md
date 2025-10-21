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
| [aws_security_group.alb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.nginx_app_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.ssh_only_my_ip_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Alb_SG_id"></a> [Alb\_SG\_id](#output\_Alb\_SG\_id) | n/a |
| <a name="output_Alb_SG_name"></a> [Alb\_SG\_name](#output\_Alb\_SG\_name) | ALB SG outputs |
| <a name="output_Nginx_SG_id"></a> [Nginx\_SG\_id](#output\_Nginx\_SG\_id) | n/a |
| <a name="output_Nginx_SG_name"></a> [Nginx\_SG\_name](#output\_Nginx\_SG\_name) | n/a |
| <a name="output_SSH_SG_id"></a> [SSH\_SG\_id](#output\_SSH\_SG\_id) | n/a |
| <a name="output_SSH_SG_name"></a> [SSH\_SG\_name](#output\_SSH\_SG\_name) | SSH SG outputs |
