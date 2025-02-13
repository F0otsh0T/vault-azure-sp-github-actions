

path "secret/data/*"
{
  capabilities = ["read", "list"]
}

path "azurekvv2/data/*"
{
  capabilities = ["read", "list"]
}

path "azure/creds/demo-example-role" # # Allow retrieval of Azure Credentials at `azure/creds/demo-example-role`
{
  capabilities = ["read"]
}
