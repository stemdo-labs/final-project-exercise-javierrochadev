resource "azurerm_virtual_network" "vnet0" {
  name                = "vnet_0"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet_1"
  location            = var.cluster_location
  resource_group_name = var.resource_group_name
  address_space       = ["10.1.0.0/16"]
}
