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