resource "azurerm_virtual_network" "vnet0" {
  name                = "vnet_0"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}


