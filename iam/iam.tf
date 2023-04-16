resource "aws_iam_user" "develop" {
  name = "develop"
}

resource "aws_iam_access_key" "develop" {
  user    = aws_iam_user.develop.name
  pgp_key = "keybase:nao_e"
}

resource "aws_iam_user_login_profile" "develop" {
  user    = aws_iam_user.develop.name
  pgp_key = "keybase:nao_e"
}

resource "aws_iam_user_policy" "develop" {
  name   = "develop"
  user   = aws_iam_user.develop.name
  policy = data.aws_iam_policy_document.develop-doc.json
}

data "aws_iam_policy_document" "develop-doc" {
  statement {
    effect = "Allow"
    not_actions = [
      "iam:*",
      "organizations:*",
      "account:*"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "iam:CreateServiceLinkedRole",
      "iam:DeleteServiceLinkedRole",
      "iam:ListRoles",
      "organizations:DescribeOrganization",
      "account:ListRegions"
    ]
    resources = ["*"]
  }
}

output "secret" {
  value = aws_iam_access_key.develop.encrypted_secret
}

output "password" {
  value = aws_iam_user_login_profile.develop.encrypted_password
}
