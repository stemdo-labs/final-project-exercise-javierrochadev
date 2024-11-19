

variable "subnet_names" {
  description = "Nombres de las redes virtuales para el peering"
  type        = list(string)
}



variable "resource_group_name" {
  description = "El nombre del grupo de recursos de Azure"
  type        = string
}

variable "location" {
  description = "El nombre de la localizacion de los recursos de Azure"
  type        = string
}


variable "replicas" {
  description = "El número de réplicas de los recursos de Azure"
  type        = number
}

