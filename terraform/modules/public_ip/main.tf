# Crear una IP pública
resource "azurerm_public_ip" "public_ip" {
  name                = "example-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"  
  sku                 = "Basic"
}