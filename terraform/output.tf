# Usar la salida del módulo vnet
# output "vnet_names_from_module" {
#   value = module.vnet.vnet_names  
# }

# output "vnet_ids_from_module" {
#   value = module.vnet.vnet_ids  
# }
# 
# output "nsg_ids" {
#   value = module.nsg.nsg_ids
# }
# 
output "vm_nic_ids" {
  value = module.vm_nic.vm_nic_ids
}

# output "subnet_ids" {
#   value = module.subnet.subnet_ids
# }

# output "disk_ids" {
#   value = module.disk.disk_ids
# }

output "id" {
  value = module.public_ip.id
}
