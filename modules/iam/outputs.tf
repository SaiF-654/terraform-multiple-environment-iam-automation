output "aws_iam_user" {
  value = aws_iam_user.user.name
}

output "aws_iam_group" {
  value = aws_iam_group.group.name
}

output "aws_iam_role" {
  value = aws_iam_role.ec2_role.name
}

output "ec2_instance_profile" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}

output "access_key_id" {
  value     = aws_iam_access_key.access_key.id
  sensitive = true
}

output "secret_access_key" {
  value     = aws_iam_access_key.access_key.secret
  sensitive = true
}