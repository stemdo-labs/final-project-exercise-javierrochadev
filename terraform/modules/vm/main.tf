resource "azurerm_linux_virtual_machine" "vm" {
  count               = length(var.vm_config)  # Número de elementos en el mapa

  # Usamos count.index como un índice numérico
  name                = "vm-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_config[count.index].vm_size

  network_interface_ids = [
    var.network_interface_ids[count.index]
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_config[count.index].os_publisher
    offer     = var.vm_config[count.index].os_offer
    sku       = var.vm_config[count.index].os_sku
    version   = var.vm_config[count.index].os_version
  }

  admin_username = var.vm_config[count.index].admin_username
  admin_password = var.vm_config[count.index].admin_password
  disable_password_authentication = false

  # Aquí usamos count.index para el índice
  tags = {
    "iteration_index" = count.index
  }
}
