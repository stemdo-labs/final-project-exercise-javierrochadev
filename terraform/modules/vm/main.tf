resource "azurerm_virtual_machine" "vm" {
  count               = length(var.vm_config)  # Número de elementos en el mapa

  # Usamos count.index como un índice numérico
  name                = "vm-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  vm_size             = var.vm_config[count.index].vm_size

  network_interface_ids = [
    var.network_interface_ids[count.index]
  ]

  # Eliminar el disco existente y crear un disco de sistema operativo desde la imagen
  storage_os_disk {
    name            = "os-disk-${count.index}"
    caching         = "ReadWrite"  # o "ReadOnly" según tus necesidades
    create_option   = "FromImage"  # Usar la imagen para crear el disco del sistema operativo
    managed_disk_type = "Standard_LRS"  # O el tipo que desees
  }

  # Referencia a la imagen de la que se creará el disco del sistema operativo
  storage_image_reference {
    publisher = var.vm_config[count.index].os_publisher
    offer     = var.vm_config[count.index].os_offer
    sku       = var.vm_config[count.index].os_sku
    version   = var.vm_config[count.index].os_version
  }

  delete_os_disk_on_termination = true  # El disco del sistema operativo se elimina al terminar la VM

  os_profile {
    computer_name  = var.vm_config[count.index].name
    admin_username = var.vm_config[count.index].admin_username
    admin_password = var.vm_config[count.index].admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

 
}
