resource "azurerm_storage_container" "backup_container" {
  name                  = "backupcontainer"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "example" {
  name                   = "backup"
  storage_account_name   = var.storage_account_name
  storage_container_name = azurerm_storage_container.backup_container.name
  type                   = "Block"
}


