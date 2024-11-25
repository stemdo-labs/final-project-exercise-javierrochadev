output "vnet_names" {
  value = [
    azurerm_virtual_network.vnet0.name,
    azurerm_virtual_network.vnet1.name
  ]
}

output "vnet_ids" {
  value = [
    azurerm_virtual_network.vnet0.id,
    azurerm_virtual_network.vnet1.id
  ]
}
