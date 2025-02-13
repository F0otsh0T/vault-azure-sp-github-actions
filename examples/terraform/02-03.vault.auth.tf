# 02-03.vault.auth.tf

################################################
# AUTH: OIDC / JWT
# GitHub <=> Vault Auth
# https://docs.github.com/en/actions/security-for-github-actions/security-hardening-your-deployments/configuring-openid-connect-in-hashicorp-vault

resource "vault_jwt_auth_backend" "github" {
    description         = "GitHub OIDC or JWT Auth"
    path                = "jwt-github"
    oidc_discovery_url  = "https://token.actions.githubusercontent.com"
    bound_issuer        = "https://token.actions.githubusercontent.com"
}

resource "vault_jwt_auth_backend_role" "github_role_actions" {
  backend           = vault_jwt_auth_backend.github.path
  role_name         = "github_role_actions"
  role_type         = "jwt"
  user_claim        = "actor"
  bound_claims_type = "string"
  bound_audiences   = [
    var.github_bound_audience
  ]
  token_policies = [
    vault_policy.vault_github_secret_read.name,
  ]
  bound_claims = {
    repository = "F0otsh0T/vault-azure-sp-github-action"
  }
}
