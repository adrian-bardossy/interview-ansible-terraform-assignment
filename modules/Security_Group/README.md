## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ssh_only_my_ip_sg"></a> [ssh\_only\_my\_ip\_sg](#module\_ssh\_only\_my\_ip\_sg) | terraform-aws-modules/security-group/aws//modules/ssh | 5.2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Alb_SG_arn"></a> [Alb\_SG\_arn](#output\_Alb\_SG\_arn) | n/a |
| <a name="output_Alb_SG_id"></a> [Alb\_SG\_id](#output\_Alb\_SG\_id) | n/a |
| <a name="output_Alb_SG_name"></a> [Alb\_SG\_name](#output\_Alb\_SG\_name) | ALB SG outputs |
| <a name="output_Nginx_SG_arn"></a> [Nginx\_SG\_arn](#output\_Nginx\_SG\_arn) | n/a |
| <a name="output_Nginx_SG_id"></a> [Nginx\_SG\_id](#output\_Nginx\_SG\_id) | n/a |
| <a name="output_Nginx_SG_name"></a> [Nginx\_SG\_name](#output\_Nginx\_SG\_name) | NGINX SG outputs |
| <a name="output_SSH_SG_arn"></a> [SSH\_SG\_arn](#output\_SSH\_SG\_arn) | n/a |
| <a name="output_SSH_SG_id"></a> [SSH\_SG\_id](#output\_SSH\_SG\_id) | n/a |
| <a name="output_SSH_SG_name"></a> [SSH\_SG\_name](#output\_SSH\_SG\_name) | SSH SG outputs |
