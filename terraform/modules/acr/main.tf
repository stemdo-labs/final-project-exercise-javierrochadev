resource "random_id" "acr_suffix" {
  byte_length = 4  
}

resource "azurerm_container_registry" "acr" {
  name                = "myacrjrochadev" 
  location            = var.location                       
  resource_group_name = var.resource_group_name            
  sku                  = "Basic"                            
  admin_enabled       = true                                
}