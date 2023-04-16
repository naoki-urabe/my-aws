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

output "secret" {
  value = aws_iam_access_key.develop.encrypted_secret
}

output "password" {
  value = aws_iam_user_login_profile.develop.encrypted_password
}
