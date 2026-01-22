
# IAM user
resource "aws_iam_user" "user" {
  name = var.iam_user
}
# IAM Group
resource "aws_iam_group" "group" {
  name = var.iam_group
}

# Assign user to group
resource "aws_iam_user_group_membership" "membership" {
  user = aws_iam_user.user.name
  groups = [aws_iam_group.group.name]
}

# Least-privilege policy for EC2
# resource "aws_iam_policy" "ec2_custom_policy" {
#   name        = "EC2CustomPolicy"
#   description = "Least-privilege policy for EC2 instance"

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Action = [
#           "ec2:DescribeInstances",
#           "ec2:StartInstances",
#           "ec2:StopInstances",
#           "ec2:RebootInstances"
#         ],
#         Resource = "*"
#       },
#       {
#         Effect = "Allow",
#         Action = [
#           "ec2:DescribeVolumes",
#           "ec2:AttachVolume",
#           "ec2:DetachVolume"
#         ],
#         Resource = "*"
#       },
#       {
#         Effect = "Allow",
#         Action = [
#           "logs:CreateLogGroup",
#           "logs:CreateLogStream",
#           "logs:PutLogEvents"
#         ],
#         Resource = "*"
#       }
#     ]
#   })
# }



# Attach Policies to Group
resource "aws_iam_group_policy_attachment" "group_policies" {
  for_each = {
    "AmazonEC2FullAccess" = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
    "AmazonS3FullAccess" = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  }
  group = aws_iam_group.group.name
  policy_arn = each.value
}

#Attach Custom policy to Group
# resource "aws_iam_group_policy_attachment" "custom_group_policy" {
#   group = aws_iam_group.group.name
#   policy_arn = aws_iam_policy.ec2_custom_policy.arn
# }

# Create IAM Role
resource "aws_iam_role" "ec2_role" {
  name = var.iam_role
  assume_role_policy = jsonencode({
    Version= "2012-10-17",
    Statement= [{
            Effect= "Allow"
            Principal= {
                Service= "ec2.amazonaws.com"
            },
            Action= "sts:AssumeRole"
        }]
})
}

# Attach Policies to IAM role
resource "aws_iam_role_policy_attachment" "ec2_role_polic" {
  for_each = toset(var.iam_policies)
  role = aws_iam_role.ec2_role.name
  policy_arn = each.value
}

#Attach custom policy to Role
# resource "aws_iam_role_policy_attachment" "ec2_role_custom_policy" {
#   role = aws_iam_role.ec2_role.name
#   policy_arn = aws_iam_policy.ec2_custom_policy.arn
# }

# Create Instance Profile
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = var.iam_instance_profile
  role = aws_iam_role.ec2_role.name
}

# Optional: Create access key for IAM user
resource "aws_iam_access_key" "access_key" {
  user = aws_iam_user.user.name
}