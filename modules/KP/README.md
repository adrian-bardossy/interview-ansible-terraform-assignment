## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_key-pair"></a> [key-pair](#module\_key-pair) | terraform-aws-modules/key-pair/aws | 2.0.3 |

## Resources

| Name | Type |
|------|------|
| [local_file.KP_pem_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_key_name"></a> [instance\_key\_name](#input\_instance\_key\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_private_key_name"></a> [ec2\_private\_key\_name](#output\_ec2\_private\_key\_name) | n/a |
| <a name="output_private_key_pem"></a> [private\_key\_pem](#output\_private\_key\_pem) | n/a |
