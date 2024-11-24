terraform {
  backend "azurerm" {
    resource_group_name   = "rg-jrocha-dvfinlab"   
    storage_account_name  = "stajrochadvfinlab"        
    container_name        = "tfstatecont"                     
    key                   = "terraform.tfstate"           
  }
}

provider "azurerm" {
  client_id       = var.AZURE_CLIENT_ID       # ID del Service Principal
  client_secret   = var.AZURE_CLIENT_SECRET   # Secreto del Service Principal
  tenant_id       = var.AZURE_TENANT_ID       # Tenant ID
  subscription_id = var.AZURE_SUBSCRIPTION_ID # Subscription ID

  features {}
}


module "vnet" {
  source              = "./modules/vnet"
  replicas            = 2
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Crear peering entre las dos redes virtuales
module "peering" {
  source                    = "./modules/peering"
  replicas                  = length(module.vnet.vnet_names)
  vnet_names                = module.vnet.vnet_names
  vnet_ids                  = reverse(module.vnet.vnet_ids)
  resource_group_name       = var.resource_group_name
}


module "nsg" {
  replicas            = 2
  source              = "./modules/nsg"
  subnet_names        = var.subnet_names
  location            = var.location
  resource_group_name = var.resource_group_name

}

module "subnet" {
  source               = "./modules/subnet"
  replicas             = 2
  subnet_names         = var.subnet_names
  vnet_names           = module.vnet.vnet_names        
  resource_group_name  = var.resource_group_name

  # network_security_group_ids = module.nsg.nsg_ids
}

module "public_ip" {
  source              = "./modules/public_ip"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "vm_nic" {
  source              = "./modules/pic"
  vm_config           = var.vm_config
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.subnet.subnet_ids[0]
  public_ip_id        = module.public_ip.id
}

module "disk" {
  source               = "./modules/disc"
  replicas             = 2
  location             = var.location
  resource_group_name  = var.resource_group_name
}



module "vm" {
  source              = "./modules/vm"
  disk_ids       = module.disk.disk_ids 
  vm_config           = var.vm_config
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = module.vm_nic.vm_nic_ids
}


module "aks_cluster" {
  source              = "./modules/aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  node_count          = 2
  subnet_id           = module.subnet.subnet_ids[1]
}

module "acr" {
  source              = "./modules/acr"
  location            = var.location                 
  resource_group_name = var.resource_group_name      
}

