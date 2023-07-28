# Add OIDC provider for GitHub, so that Actions can assume roles without needing to store credentials
module "iam_github_oidc_provider" {
  source = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-provider"
  create = false
}

module "iam_github_oidc_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-role"
  # This repo
  subjects = ["fbatta/terraform-aws-iot:*"]
  policies = {
    IAMOIDCFullAccess = "arn:aws:iam::359113079523:policy/IAMOIDCFullAccess"
    IoTFullAccess = "arn:aws:iam::aws:policy/AWSIoTFullAccess"
  }
  create = false
  name = "GitHubActionsRole"
}