terraform {
	required_providers {
		random = {
  			source  = "hashicorp/random"
  		 	version = "~> 3.1.0"
  		}

		azurerm = {
			source = "hashicorp/azurerm"
			version = ">2.0.0"
		}
	}
}

provider "azurerm" {
	features {}
}
provider "azurerm" {
	features {}
	alias = "credentials_fetcher"
}
resource "random_string" "name_suffix" {
	length = 4
	upper = false
	special = false
	number = false
}
locals {
	base_name = "${var.name}-${random_string.name_suffix.result}"
}
module "az_deploy_creds" {
  providers = {
    azurerm = azurerm.credentials_fetcher
  }
  source                      = "./modules/azure_deploy_creds"
  kv_resource_group_name      = var.az_deploy_cred_kv_resource_group_name
  kv_name                     = var.az_deploy_cred_kv_name
  kv_client_id_secret_key     = var.az_deploy_cred_kv_client_id_secret_key
  kv_client_secret_secret_key = var.az_deploy_cred_kv_client_secret_secret_key
}
provider "azurerm" {
  features {}
  alias           = "deploy"
  subscription_id = module.az_deploy_creds.subscription_id
  tenant_id       = module.az_deploy_creds.tenant_id
  client_id       = module.az_deploy_creds.client_id
  client_secret   = module.az_deploy_creds.client_secret
}

module "aks" {
	providers = {
		azurerm = azurerm.deploy
	}
	source = "./modules/aks"
	base_name = local.base_name
	location = var.location
}
