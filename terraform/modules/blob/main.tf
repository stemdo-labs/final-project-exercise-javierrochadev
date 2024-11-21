resource "azurerm_storage_container" "container_backup" {
  name                  = "containerbackup"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}
