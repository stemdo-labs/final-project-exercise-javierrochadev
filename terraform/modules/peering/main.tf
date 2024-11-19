# Crear peering entre las dos redes virtuales
resource "azurerm_virtual_network_peering" "example" {
  count                    = var.replicas
  name                     = "peer-${var.vnet_names[count.index]}"
  resource_group_name      = var.resource_group_name
  # Esta es la red origen
  virtual_network_name     = var.vnet_names[count.index]
  # Esta es la red destino
  remote_virtual_network_id = var.vnet_ids[count.index] 
  allow_virtual_network_access = true
  allow_forwarded_traffic = true
  allow_gateway_transit = false
  use_remote_gateways = false
}
