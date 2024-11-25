# Clúster de AKS
resource "azurerm_kubernetes_cluster" "example" {
  name                = "mi_cluster"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "micluster"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = "Standard_B2s"
    vnet_subnet_id = var.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }
}
