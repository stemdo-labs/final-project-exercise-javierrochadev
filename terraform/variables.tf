

variable "resource_group_name" {
  description = "El nombre del grupo de recursos de Azure"
  type        = string
  default     = "rg-jrocha-dvfinlab" 
}

variable "subnet_production_id" {
  description = "El nombre del grupo de recursos de Azure"
  type        = string
}

variable "location" {
  description = "El nombre de la localizacion de los recursos de Azure"
  type        = string
  default     = "UK South"
}


variable "subnet_names" {
  description = "Los nombres de las dubredes de Azure"
  type        = list(string)
  default     = ["virtual_machines", "app"]
}

variable "storage_account_name" {
  description = "Los nombres de las dubredes de Azure"
  type        = string
  default     = "stajrochadvfinlab"
}

variable "container_name" {
  description = "Los nombres de las dubredes de Azure"
  type        = string
  default     = "tfstate"
}



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

 default = {
  0 = {
    public_ip      = true
    private_ip     = "10.0.33.4"
    name           = "vm-bd"
    vm_size        = "Standard_B1ms"
    admin_username = "adminuser1"
    admin_password = "P@ssw0rd1234!"
    subnet_name    = "subnet1"
    os_publisher   = "Canonical"
    os_offer       = "0001-com-ubuntu-server-jammy"
    os_sku         = "22_04-lts"      # Ubuntu 18.04 LTS Desktop
    os_version     = "latest"
  },
  # 1 = {
  #   public_ip      = true
  #   private_ip     = "10.0.1.5"
  #   name           = "vm-backup"
  #   vm_size        = "Standard_B1ms"
  #   admin_username = "adminuser2"
  #   admin_password = "P@ssw0rd5678!"
  #   subnet_name    = "subnet2"
  #   os_publisher   = "Canonical"
  #   os_offer       = "UbuntuServer"
  #   os_sku         = "22.04-LTS"      # Ubuntu 18.04 LTS Desktop
  #   os_version     = "latest"
  # }
}

}



        
