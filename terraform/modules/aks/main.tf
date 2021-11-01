terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.69.0"
    }
  }
}

resource "azurerm_resource_group" "default" {
	name = "rg-${var.base_name}"
	location = var.location
}

resource "azurerm_kubernetes_cluster" "wfe-k8s" {
  name                = "${var.base_name}-wfe"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "${var.base_name}-dns"
  node_resource_group = "node-rg-${var.base_name}-${azurerm_resource_group.default.name}"

  default_node_pool {
    name       = "defaultnode"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  role_based_access_control {
    enabled = true
  }


  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "devlopment"
  }
}

