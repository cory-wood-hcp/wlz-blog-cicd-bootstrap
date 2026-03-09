# WLZ Blog Pipeline Bootstrap

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.58 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 6.0 |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | ~> 0.58 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository.intake_repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [tfe_project.wlz_aws_create](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) | resource |
| [tfe_project.wlz_aws_operate](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) | resource |
| [tfe_project.wlz_aws_sandbox](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) | resource |
| [tfe_project.wlz_root](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) | resource |
| [tfe_project_variable_set.wlz_aws_create_tfe_access](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project_variable_set) | resource |
| [tfe_project_variable_set.wlz_root_tfe_access](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project_variable_set) | resource |
| [tfe_variable.tfe_token](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable_set.tfe_access](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable_set) | resource |
| [tfe_workspace.intake_workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tfe_organization"></a> [tfe\_organization](#input\_tfe\_organization) | The name of the Terraform Enterprise organization to configure. | `string` | `"corydon-wood-sandbox"` | no |
| <a name="input_tfe_token"></a> [tfe\_token](#input\_tfe\_token) | Terraform Enterprise API token with permissions to create workspaces and variables. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_create_project_id"></a> [create\_project\_id](#output\_create\_project\_id) | n/a |
| <a name="output_operate_project_id"></a> [operate\_project\_id](#output\_operate\_project\_id) | n/a |
| <a name="output_root_project_id"></a> [root\_project\_id](#output\_root\_project\_id) | n/a |
| <a name="output_sandbox_project_id"></a> [sandbox\_project\_id](#output\_sandbox\_project\_id) | n/a |