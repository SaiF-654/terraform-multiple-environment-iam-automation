iam_user  = "devops-user-miseacademy"
iam_group = "DevOpsGroup_Miseacademy"
iam_policies = [
  "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
  "arn:aws:iam::aws:policy/AmazonS3FullAccess"
]
iam_role             = "EC2-role-dev"
iam_instance_profile = "EC2-InstanceProfile-dev"