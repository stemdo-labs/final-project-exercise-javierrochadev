resource "azurerm_network_interface" "vm_nic" {
  for_each            = var.vm_config
  name                = "${each.value.name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
  name                          = "${each.value.name}-ipConfig"
  subnet_id                     = var.subnet_id
  private_ip_address_allocation = "Static" 
  private_ip_address            = each.value.private_ip
  public_ip_address_id          = each.value.public_ip ? var.public_ip_id : null
}

}
