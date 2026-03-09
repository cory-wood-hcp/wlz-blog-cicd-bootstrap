variable "tfe_organization" {
  description = "The name of the Terraform Enterprise organization to configure."
  default = "corydon-wood-sandbox"
}

variable "tfe_token" {
    description = "Terraform Enterprise API token with permissions to create workspaces and variables."
    type        = string
  sensitive = true
}