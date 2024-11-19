resource "azurerm_virtual_network" "vnet" {
  count               = var.replicas
  name                = "myVnet-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.${count.index}.0.0/16"]
}