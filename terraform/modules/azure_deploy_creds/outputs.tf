# -----------------------------------------------------------------------
# AZURE DEPLOY CREDENTIALS MODULE --- DO NOT NEED TO MODIFY
# -----------------------------------------------------------------------
output "subscription_id" {
  description = "Deployment subscription ID"
  value       = data.azurerm_client_config.current.subscription_id
  sensitive   = true
}
output "tenant_id" {
  description = "Deployment tenant ID"
  value       = data.azurerm_client_config.current.tenant_id
  sensitive   = true
}
output "client_id" {
  description = "Deployment client ID"
  value       = data.azurerm_key_vault_secret.deploy_client_id.value
  sensitive   = true
}
output "client_secret" {
  description = "Deployment client secret"
  value       = data.azurerm_key_vault_secret.deploy_client_secret.value
  sensitive   = true
}
