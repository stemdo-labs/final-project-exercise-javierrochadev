provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "vnet" {
  source              = "./modules/vnet"
  replicas            = 2
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Crear peering entre las dos redes virtuales
module "peering" {
  source                    = "./modules/peering"
  replicas                  = length(module.vnet.vnet_names)
  vnet_names                = module.vnet.vnet_names
  vnet_ids                  = reverse(module.vnet.vnet_ids)
  resource_group_name       = var.resource_group_name
}
