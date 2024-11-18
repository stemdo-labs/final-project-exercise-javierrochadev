output "subnet_ids" {
  value = [for subnet in azurerm_subnet.subnet : subnet.id]
}
