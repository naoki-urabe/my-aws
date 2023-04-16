# develop
resource "aws_iam_group" "power_user" {
  name = "power-user"
}

resource "aws_iam_group_policy_attachment" "power_user_attach" {
  group      = "power-user"
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_group_membership" "power_user" {
  name = "power-user-membership"
  users = [
    aws_iam_user.develop.name
  ]
  group = aws_iam_group.power_user.name
}

# admin
resource "aws_iam_group" "admin" {
  name = "admin"
}

resource "aws_iam_group_policy_attachment" "admin_attach" {
  group      = "admin"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_membership" "admin" {
  name = "admin-membership"
  users = [
    aws_iam_user.admin.name
  ]
  group = aws_iam_group.admin.name
}