# -----------------------------------------------------------------------
# AZURE DEPLOY CREDENTIALS MODULE --- DO NOT NEED TO MODIFY
# -----------------------------------------------------------------------
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.69.0"
    }
  }
}

data "azurerm_client_config" "current" {}
data "azurerm_key_vault" "default" {
  resource_group_name = var.kv_resource_group_name
  name                = var.kv_name
}
data "azurerm_key_vault_secret" "deploy_client_id" {
  key_vault_id = data.azurerm_key_vault.default.id
  name         = var.kv_client_id_secret_key
}
data "azurerm_key_vault_secret" "deploy_client_secret" {
  key_vault_id = data.azurerm_key_vault.default.id
  name         = var.kv_client_secret_secret_key
}
