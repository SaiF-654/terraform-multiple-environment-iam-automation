module "iam" {
  source               = "../../modules/iam"
  iam_user             = var.iam_user
  iam_group            = var.iam_group
  iam_policies         = var.iam_policies
  iam_role             = var.iam_role
  iam_instance_profile = var.iam_instance_profile
}