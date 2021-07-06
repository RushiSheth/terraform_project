output "rgroup" {
  value = module.rgroup.rg_name
}

output "location" {
  value = module.rgroup.location_name
}

output "Vnet_name" {
  value = module.network.Vnet_name
}
output "vnet_address_space" {
  value = module.network.vnet_address_space
}

output "subnet_name" {
  value = module.network.subnet_name
}


output "subnet_add_space" {
   value = module.network.subnet_add_space
}


output "linux_VM_Hostname" {
  value = module.vmlinux.linux_VM_Hostname
}

output "linux_Private_IP" {
  value = module.vmlinux.linux_Private_IP
}

output "linux_Public_IP" {
  value = module.vmlinux.linux_Public_IP
}

output "windows_VM_Hostname" {
  value = module.vmwindows.windows_VM_Hostname
}

output "windows_Private_IP" {
  value = module.vmwindows.windows_Private_IP

}

output "windows_Public_IP" {
  value = module.vmwindows.windows_Public_IP

}



