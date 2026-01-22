iam_user  = "devops-user-miseacademy-stg"
iam_group = "DevOpsGroup_Miseacademy-stg"
iam_policies = [
  "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
  "arn:aws:iam::aws:policy/AmazonS3FullAccess"
]
iam_role             = "EC2-Role-stg"
iam_instance_profile = "EC2-InstanceProfile-stg"