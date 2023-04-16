# develop
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

output "develop_secret" {
  value = aws_iam_access_key.develop.encrypted_secret
}

output "develop_password" {
  value = aws_iam_user_login_profile.develop.encrypted_password
}

# admin
resource "aws_iam_user" "admin" {
  name = "admin"
}

resource "aws_iam_access_key" "admin" {
  user    = aws_iam_user.admin.name
  pgp_key = "keybase:nao_e"
}

resource "aws_iam_user_login_profile" "admin" {
  user    = aws_iam_user.admin.name
  pgp_key = "keybase:nao_e"
}

output "admin_secret" {
  value = aws_iam_access_key.admin.encrypted_secret
}

output "admin_password" {
  value = aws_iam_user_login_profile.admin.encrypted_password
}