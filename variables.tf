variable "tfe_organization" {
  description = "The name of the Terraform Enterprise organization to configure."
  type        = string
}

variable "tfe_token" {
  description = "Terraform Enterprise API token with permissions to create workspaces and variables."
  type        = string
  sensitive   = true
}
variable "github_owner" {
  description = "The GitHub owner (user or organization) where the Terraform configuration repository is located."
  type        = string
}

variable "iam_run_role_arn" {
  description = "ARN of the role iam workspaces will used to access AWS and then assume the account specific role for iam configuration"
  type        = string
}

variable "account_creation_run_role_arn" {
  description = "ARN of the role account creation workspaces will use to access the management account"
  type        = string
}