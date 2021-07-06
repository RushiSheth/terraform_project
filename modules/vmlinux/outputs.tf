output "linux_VM_Hostname" {
  value = [azurerm_linux_virtual_machine.linux_vm[*].computer_name]
}

output "linux_VM_Id" {
  value = [azurerm_linux_virtual_machine.linux_vm[*].id]
}

output "linux_Private_IP" {
  value = [azurerm_linux_virtual_machine.linux_vm[*].private_ip_address]
}

output "linux_Public_IP" {
  value = [azurerm_linux_virtual_machine.linux_vm[*].public_ip_address]
}

