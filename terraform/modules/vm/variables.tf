variable "vm_config" {
  type = map(object({
    public_ip          = bool
    private_ip         = string
    name               = string         # Tamaño de la máquina virtual, por ejemplo, "Standard_DS1_v2"
    vm_size            = string         # Tamaño de la máquina virtual, por ejemplo, "Standard_DS1_v2"
    admin_username     = string         # Nombre de usuario administrador
    admin_password     = string         # Contraseña del usuario administrador
    subnet_name        = string         # Nombre de la subred donde se desplegará la VM
    os_publisher       = string         # Proveedor de la imagen del SO
    os_offer           = string         # Oferta del sistema operativo (SO)
    os_sku             = string         # SKU de la imagen
    os_version         = string         # Versión de la imagen
  }))

}


variable "location" {
  type = string

}

variable "resource_group_name" {
  type = string

}

variable "network_interface_ids" {
  type = list(string)

}

variable "disk_ids"{
  type = list(string)
}







