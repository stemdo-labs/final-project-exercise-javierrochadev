resource "azurerm_storage_container" "container_backup" {
  name                  = "containerbackup"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "example" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = var.storage_account_name
  storage_container_name = azurerm_storage_container.container_backup.name
  type                   = "Block"
}