# Usar la salida del módulo vnet
output "vnet_names_from_module" {
  value = module.vnet.vnet_names  # Captura las salidas del módulo vnet
}

output "vnet_ids_from_module" {
  value = module.vnet.vnet_ids  # Captura las salidas del módulo vnet
}

output "nsg_ids" {
  value = module.nsg.nsg_ids
}

output "vm_nic_ids" {
  value = module.vm_nic.vm_nic_ids
}

output "subnet_ids" {
  value = module.subnet.subnet_ids
}
