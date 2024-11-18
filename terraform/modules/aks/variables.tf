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

# Variable para el número de nodos en el clúster
variable "node_count" {
  description = "Número de nodos en el clúster de AKS"
  type        = number
}

# Variable para el ID de la subred donde se desplegarán los nodos
variable "subnet_id" {
  description = "El ID de la subred donde se desplegarán los nodos de AKS"
  type        = string
}
