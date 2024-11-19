resource "azurerm_managed_disk" "disk" {
  count                = var.replicas
  name                 = "disk-${count.index}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"   # O "Premium_LRS" para discos de alto rendimiento
  disk_size_gb         = 128              # Tamaño del disco en GB

  create_option        = "Empty"          # "Empty" crea un disco vacío; usa "Copy" o "Import" para clonar o importar
}
