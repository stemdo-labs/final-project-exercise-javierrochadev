output "disk_ids" {
  value = [for disk in azurerm_managed_disk.disk : disk.id]
  description = "Lista de los IDs de los discos creados"
}
