# 03-01.github..tf

################################################
# GitHub Actions Environments / Secrets

# REPO: GITHUB ACTIONS

data "github_repository" "github_actions" {
  full_name = "F0otsh0T/vault-azure-sp-github-actions"
}

# resource "github_repository_environment" "github_action_environment" {
#   repository       = data.github_repository.github_actions.name
#   environment      = "github_action_environment"
# }

resource "github_actions_variable" "action_vault_url" {
  repository       = data.github_repository.github_actions.name
  variable_name    = "VAULT_URL"
  value            = var.vault_url
}

resource "github_actions_variable" "action_vault_auth_path" {
  repository       = data.github_repository.github_actions.name
  variable_name    = "VAULT_AUTH_PATH"
  value            = vault_jwt_auth_backend.github.path
}

resource "github_actions_variable" "action_vault_namespace" {
  repository       = data.github_repository.github_actions.name
  variable_name    = "VAULT_NAMESPACE"
  value            = var.vault_namespace
}

resource "github_actions_variable" "action_vault_role" {
  repository       = data.github_repository.github_actions.name
  variable_name    = "VAULT_ROLE"
  value            = vault_jwt_auth_backend_role.github_role_actions.role_name
}

resource "github_actions_variable" "action_vault_path_azure" {
  repository       = data.github_repository.github_actions.name
  variable_name    = "SECRET_PATH_AZURE"
  value            = "azure/creds/demo-example-role" # Vault Azure Secrets Endpoint to get Azure Service Principal `client_id` and `client_secret`
}

resource "github_actions_variable" "action_vault_path_kv_01" {
  repository       = data.github_repository.github_actions.name
  variable_name    = "SECRET_PATH_KV_01"
  value            = vault_kv_secret_v2.azurevaultkv01.path # "azurekvv2/data/azurevaultkv01"
}

resource "github_actions_variable" "action_vault_path_kv_02" {
  repository       = data.github_repository.github_actions.name
  variable_name    = "SECRET_PATH_KV_02"
  value            = vault_kv_secret_v2.azurevaultkv02.path # "azurekvv2/data/azurevaultkv02"
}

resource "github_actions_secret" "action_vault_token" {
  repository        = data.github_repository.github_actions.name
  secret_name       = "VAULT_TOKEN"
  plaintext_value   = vault_token.demo-example-token.client_token
}

resource "github_actions_secret" "action_azure_subscription" {
  repository        = data.github_repository.github_actions.name
  secret_name       = "AZURE_SUBSCRIPTION"
  plaintext_value   = var.azure_subscription_id
}

resource "github_actions_secret" "action_azure_tenant" {
  repository        = data.github_repository.github_actions.name
  secret_name       = "AZURE_TENANT"
  plaintext_value   = var.azure_tenant_id
}

################################################


