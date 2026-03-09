variable "tfe_organization" {
  description = "The name of the Terraform Enterprise organization to configure."
  type = string
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