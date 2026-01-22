variable "iam_user" {
  type = string
}
variable "iam_group" {
  type = string
}

variable "iam_policies" {
  type = list(string)
}

variable "iam_role" {
  type = string
}
variable "iam_instance_profile" {
  type = string
}