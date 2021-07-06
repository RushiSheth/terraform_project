resource "null_resource" "linux_provisioner" {
    count = var.nb_count
    depends_on = [
        azurerm_linux_virtual_machine.linux_vm,
        azurerm_network_interface.linux_nic
    ]
    triggers = {
        network_interface_ids = join(",", azurerm_network_interface.linux_nic[*].id)
    }

    provisioner "local-exec" {
        command ="sleep 5 ; cat /etc/hosts"

        connection {
    type     = "ssh"
    user     = var.vm_admin_user
    private_key = file(var.public_key_path)
    host     = "${element(azurerm_linux_virtual_machine.linux_vm[*].computer_name, 0)}"
  }
    
    }
  
}