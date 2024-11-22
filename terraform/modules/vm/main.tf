resource "azurerm_linux_virtual_machine" "vm" {
  count               = length(var.vm_config)  # Número de elementos en el mapa

  name                = "vm-${var.vm_config [count.index].name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  size             = var.vm_config[count.index].vm_size
  disable_password_authentication = false 
  admin_username = var.vm_config[count.index].admin_username
  admin_password = var.vm_config[count.index].admin_password

 
  network_interface_ids = [
    var.network_interface_ids[count.index]
  ]

#   custom_data = var.vm_config[count.index].name == "vm-backup" ? base64encode(
#     <<EOF
# #!/bin/bash
# echo "Ejecutando script de inicialización..."
# # Aquí pones el contenido de tu script
# apt-get update -y
# sudo apt install jq
# $GITHUB_TOKEN=$(curl -X POST \
#   -H "Authorization: token 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" \
#   -H "Accept: application/vnd.github+json" \
#   https://api.github.com/repos/stemdo-labs/final-project-exercise-javierrochadev/actions/runners/registration-token | jq -r .token)
# 
# mkdir actions-runner && cd actions-runner
# 
# curl -o actions-runner-linux-x64-2.320.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.320.0/actions-runner-linux-x64-2.320.0.tar.gz
# 
# echo "93ac1b7ce743ee85b5d386f5c1787385ef07b3d7c728ff66ce0d3813d5f46900  actions-runner-linux-x64-2.320.0.tar.gz" | shasum -a 256 -c
# 
# tar xzf ./actions-runner-linux-x64-2.320.0.tar.gz
# 
# sudo chown -R adminuser2:adminuser2 /actions-runner
# 
# sudo chmod -R u+w /actions-runner
# 
# sudo -u adminuser2 ./config.sh --url https://github.com/stemdo-labs/final-project-exercise-javierrochadev --token $GITHUB_TOKEN --unattented
# 
# ./scv.sh install
# ./scv.sh start
# EOF
#     ) : null

 
  os_disk {
    name            = "os-disk-${count.index}"
    storage_account_type = "Standard_LRS"
    caching         = "ReadWrite"  # o "ReadOnly" según tus necesidades
  }
 
  source_image_reference {
    publisher = var.vm_config[count.index].os_publisher
    offer     = var.vm_config[count.index].os_offer
    sku       = var.vm_config[count.index].os_sku
    version   = var.vm_config[count.index].os_version
  }
  }
 
