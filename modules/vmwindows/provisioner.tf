resource "null_resource" "win_provisioner" {
    depends_on = [
        azurerm_windows_virtual_machine.windows_vm,
        azurerm_network_interface.windows_nic
    ]
    provisioner "remote-exec" {
        inline = [
      "cmd /k hostname",
    ]
    }
  
}