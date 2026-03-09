output "root_project_id" {
  value = tfe_project.wlz_root.id
}

output "create_project_id" {
  value = tfe_project.wlz_aws_create.id
}

output "operate_project_id" {
  value = tfe_project.wlz_aws_operate.id
}

output "sandbox_project_id" {
  value = tfe_project.wlz_aws_sandbox.id
}