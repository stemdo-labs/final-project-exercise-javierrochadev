variable "resource_group_name" {
  description = "El nombre del grupo de recursos de Azure"
  type        = string
  default     = "rg-jrocha-dvfinlab" 
}

variable "location" {
  description = "El nombre de la localizacion de los recursos de Azure"
  type        = string
  default     = "East US"
}


variable "subscription_id" {
  description = "El nombre de la localizacion de los recursos de Azure"
  type        = string
  default     = "86f76907-b9d5-46fa-a39d-aff8432a1868"
}

variable "subnet_names" {
  description = "Los nombres de las dubredes de Azure"
  type        = list(string)
  default     = ["virtual_machines", "app"]
}


variable "vm_config" {
  type = map(object({
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

 default = {
  0 = {
    name           = "vm-bd"
    vm_size        = "Standard_DS1_v2"
    admin_username = "adminuser1"
    admin_password = "P@ssw0rd1234!"
    subnet_name    = "subnet1"
    os_publisher   = "Canonical"
    os_offer       = "UbuntuServer"
    os_sku         = "18.04-LTS"      # Ubuntu 18.04 LTS Desktop
    os_version     = "latest"
  },
  1 = {
    name           = "vm-backup"
    vm_size        = "Standard_DS2_v2"
    admin_username = "adminuser2"
    admin_password = "P@ssw0rd5678!"
    subnet_name    = "subnet2"
    os_publisher   = "Canonical"
    os_offer       = "UbuntuServer"
    os_sku         = "18.04-LTS"      # Ubuntu 18.04 LTS Desktop
    os_version     = "latest"
  }
}

}

