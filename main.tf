resource "tfe_project" "wlz_root" {
  organization = var.tfe_organization
  name         = "wlz-root"
}

resource "tfe_project" "wlz_aws_create" {
  organization = var.tfe_organization
  name         = "wlz-aws-create"
}

resource "tfe_project" "wlz_aws_operate" {
  organization = var.tfe_organization
  name         = "wlz-aws-operate"
}

resource "tfe_project" "wlz_aws_sandbox" {
  organization = var.tfe_organization
  name         = "wlz-aws-sandbox"
}

#Create a github repository which will be used for intake and attached to the intake workspace
resource "github_repository" "intake_repository" {
  name               = "wlz-blog-intake-aws"
  description        = "Repository for kicking of wlz pipeline"
  visibility         = "public"
  auto_init          = true
  gitignore_template = "Terraform"

  topics = [
    "terraform",
    "aws",
    "infrastructure-as-code",
  ]
}

# Create Terraform Enterprise workspace for intake
resource "tfe_workspace" "intake_workspace" {
  name                  = "wlz-aws-intake"
  organization          = var.tfe_organization
  description           = "Terraform workspace for initializing aws wlz pipelines"
  working_directory     = "/"
  file_triggers_enabled = false
  assessments_enabled   = true
  auto_apply            = true

  project_id = tfe_project.wlz_root.id

  vcs_repo {
    identifier                 = "${var.github_owner}/wlz-blog-intake-aws"
    branch                     = "main"
    github_app_installation_id = "ghain-SLYobWzLuoVpgtrh"
  }

  tags = {
    role    = "intake"
    service = "wlz-vending"
  }
  depends_on = [github_repository.intake_repository]
}

#Create variable set to provide TFE access to workspaces which will be managing TFE resources. These workspaces will be in the root and creation projects.
resource "tfe_variable_set" "tfe_access" {
  name         = "tfe_access"
  organization = var.tfe_organization
  global       = false
}

resource "tfe_variable" "tfe_token" {
  category        = "env"
  key             = "TFE_TOKEN"
  value           = var.tfe_token
  sensitive       = true
  variable_set_id = tfe_variable_set.tfe_access.id
}

resource "tfe_project_variable_set" "wlz_root_tfe_access" {
  project_id      = tfe_project.wlz_root.id
  variable_set_id = tfe_variable_set.tfe_access.id
}

resource "tfe_project_variable_set" "wlz_aws_create_tfe_access" {
  project_id      = tfe_project.wlz_aws_create.id
  variable_set_id = tfe_variable_set.tfe_access.id
}

#Variable set for aws iam access
resource "tfe_variable_set" "aws_iam_access" {
  name         = "wlz_aws_iam_configuration_access"
  organization = var.tfe_organization
  global       = false
}

resource "tfe_variable" "aws_iam_access_provider_auth" {
  category        = "env"
  key             = "TFC_AWS_PROVIDER_AUTH"
  value           = "true"
  sensitive       = true
  variable_set_id = tfe_variable_set.aws_iam_access.id
}

resource "tfe_variable" "aws_iam_access_role_arn" {
  category        = "env"
  key             = "TFC_DEFAULT_AWS_RUN_ROLE_ARN"
  value           = var.iam_run_role_arn
  variable_set_id = tfe_variable_set.aws_iam_access.id
}

#Variable set for account creation access

resource "tfe_variable_set" "aws_account_creation_access" {
  name         = "wlz_aws_account_creation_access"
  organization = var.tfe_organization
  global       = false
}

resource "tfe_variable" "aws_account_creation_auth" {
  category        = "env"
  key             = "TFC_AWS_PROVIDER_AUTH"
  value           = "true"
  variable_set_id = tfe_variable_set.aws_account_creation_access.id
}

resource "tfe_variable" "aws_account_creation_role_arn" {
  category        = "env"
  key             = "TFC_DEFAULT_AWS_RUN_ROLE_ARN"
  value           = var.account_creation_run_role_arn
  variable_set_id = tfe_variable_set.aws_account_creation_access.id
}

resource "tfe_project_variable_set" "wlz_aws_create_aws_access" {
  project_id      = tfe_project.wlz_aws_create.id
  variable_set_id = tfe_variable_set.aws_account_creation_access.id
}