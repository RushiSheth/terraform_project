variable "vm_name" {
}
variable "vm_admin_user"{
    default = "auto"
}
variable "linux_availability_set"{
}
variable "nb_count"{
}
variable "location"{
}
variable "rg_name"{
}
variable "linux_vm_size" {
  default = "Standard_B1s"
}

variable "public_key_path" {
  default = "/home/auto/.ssh/id_rsa.pub"
}
variable "linux_os_disk_attr" {
  type = map(string)
  default = {
    os_storage_Account_type = "Premium_LRS"
    os_disk_size            = "32"
    os_caching              = "ReadWrite"
  }
}

variable "linux_os_disk_info" {
  type = map(string)
  default = {
    os_publisher = "Canonical"
    os_offer     = "UbuntuServer"
    os_sku       = "19.04"
    os_version   = "latest"
  }
}
variable "tags" {

}

variable "subnet_id"{

}
