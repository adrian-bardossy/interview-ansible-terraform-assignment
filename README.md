## Assignemnt summary
### Github actions
- in .github/workflows/terraform.yml there is a pipeline file to run and deploy the modules
- on feature branch or on merge request it will run up to plan (will not run terraform apply)
- on merge and main branch it will also run a terraform apply
- terraform state file is stored on S3 bucket with state locking on dynamo db 
### Module
- Module contains 4 submodules:
  1. EC2 instance - deploys latest ubuntu 24.04 from the filter, assigns elastic ip to it
  2. KP creates a KP and stores it locally where the pipeline runs
  3. Security Group allows access from your public IP to the instance, public IP is defined in the .auto.tfvars so you don't need to enter it manually
  4. VPC sets address range from sub-module local 10.0.0.0/16 

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.100 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
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
| <a name="output_my_ip_ssh_arn"></a> [my\_ip\_ssh\_arn](#output\_my\_ip\_ssh\_arn) | n/a |
| <a name="output_my_ip_ssh_id"></a> [my\_ip\_ssh\_id](#output\_my\_ip\_ssh\_id) | n/a |
| <a name="output_my_ip_ssh_name"></a> [my\_ip\_ssh\_name](#output\_my\_ip\_ssh\_name) | n/a |
| <a name="output_private_key_name"></a> [private\_key\_name](#output\_private\_key\_name) | KP outputs |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | n/a |
