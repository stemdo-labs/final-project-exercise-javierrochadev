# Variable para la región donde se va a crear el recurso
variable "location" {
  description = "La región de Azure donde se creará el recurso"
  type        = string
}

# Variable para el nombre del grupo de recursos de Azure
variable "resource_group_name" {
  description = "Nombre del grupo de recursos de Azure"
  type        = string
}
