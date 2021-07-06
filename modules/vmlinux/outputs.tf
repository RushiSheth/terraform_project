output "linux_VM_Hostname" {
  value = [azurerm_linux_virtual_machine.linux_vm[*].computer_name]
}

output "linux_vm1_id" {
  value = azurerm_linux_virtual_machine.linux_vm[0].id
}

output "linux_vm2_id" {
  value = azurerm_linux_virtual_machine.linux_vm[1].id
}

output "linux_Private_IP" {
  value = [azurerm_linux_virtual_machine.linux_vm[*].private_ip_address]
}

output "linux_Public_IP" {
  value = [azurerm_linux_virtual_machine.linux_vm[*].public_ip_address]
}

output "Ip_lb" {
    value = [azurerm_public_ip.linux_pip[*].id]
}

