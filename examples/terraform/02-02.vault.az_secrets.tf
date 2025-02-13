# 02-02.vault.azure_secrets.tf

################################################
# VAULT SECRETS ENGINE: AZURE BACKEND

resource "vault_azure_secret_backend" "azure" {
  depends_on = [
    azuread_application.demo-example-app,
    azuread_service_principal.demo-example-sp,
    azurerm_resource_group.demo-example-rg,
  ]
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
  client_id       = azuread_application.demo-example-app.client_id
  client_secret   = azuread_application_password.demo-example-password.value
  environment     = var.azure_environment
  # use_microsoft_graph_api = true # Deprecated as of vault-1.12+
}

################################################
# VAULT AZURE ROLE

resource "vault_azure_secret_backend_role" "azure-role" {
  depends_on = [
    vault_azure_secret_backend.azure,
  ]
  role    = "demo-example-role"
  backend = vault_azure_secret_backend.azure.path
  azure_roles {
    role_name = "Contributor"
    scope     = "/subscriptions/${var.azure_subscription_id}/resourceGroups/${azurerm_resource_group.demo-example-rg.name}"
  }
}


