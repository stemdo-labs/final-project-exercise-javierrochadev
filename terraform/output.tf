# Usar la salida del módulo vnet
output "vnet_names_from_module" {
  value = module.vnet.vnet_names  # Captura las salidas del módulo vnet
}

output "vnet_ids_from_module" {
  value = module.vnet.vnet_ids  # Captura las salidas del módulo vnet
}