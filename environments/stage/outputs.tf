output "aws_iam_user" {
  value = module.iam.aws_iam_user
}

output "aws_iam_group" {
  value = module.iam.aws_iam_group
}

output "aws_iam_role" {
  value = module.iam.aws_iam_role
}

output "ec2_instance_profile" {
  value = module.iam.ec2_instance_profile
}

output "access_key_id" {
  value     = module.iam.access_key_id
  sensitive = true
}

output "secret_access_key" {
  value     = module.iam.secret_access_key
  sensitive = true
}