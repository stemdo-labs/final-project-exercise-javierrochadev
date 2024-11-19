output "vm_nic_ids" {
  value = [for nic in azurerm_network_interface.vm_nic : nic.id]
}
