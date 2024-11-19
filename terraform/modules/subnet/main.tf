resource "azurerm_subnet" "subnet" {
  count                = var.replicas
  name                 = "${var.subnet_names[count.index]}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_names[count.index]
  address_prefixes     = ["10.${count.index}.1.0/24"]  # Rango de direcciones para subnet1

}