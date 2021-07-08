resource "azurerm_availability_set" "linux_avs" {
  name                = var.linux_availability_set
  location            = var.location
  resource_group_name = var.rg_name

  tags = {
    environment = "Production"
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = "${var.vm_name}-${format("%1d", count.index+1)}"
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.linux_vm_size
  admin_username      = var.vm_admin_user
  count                = var.nb_count
  network_interface_ids = [
    element(azurerm_network_interface.linux_nic[*].id, count.index + 1)
  ]

  admin_ssh_key {
    username   = var.vm_admin_user
    public_key = file(var.public_key_path)
  }

  os_disk {
    name = "${var.vm_name}-osdisk-${format("%1d", count.index+1)}"
    caching              = var.linux_os_disk_attr.os_caching
    storage_account_type = var.linux_os_disk_attr.os_storage_Account_type
  }

  source_image_reference {
    publisher = var.linux_os_disk_info.os_publisher
    offer     = var.linux_os_disk_info.os_offer
    sku       = var.linux_os_disk_info.os_sku
    version   = var.linux_os_disk_info.os_version
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
  tags = var.tags
  lifecycle {
  }
}

resource "azurerm_network_interface" "linux_nic" {
  name                = "${var.vm_name}-nic-${format("%1d", count.index+1)}"
  count = var.nb_count
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal-${format("%1d", count.index+1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.linux_pip[*].id, count.index + 1)
  }
  tags = var.tags
  lifecycle {
   
  }
}

resource "azurerm_public_ip" "linux_pip" {
  name                = "${var.vm_name}-pip-${format("%1d", count.index+1)}"
  count = var.nb_count
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
  tags                = var.tags
  lifecycle {
    
  }
}

resource "azurerm_backup_protected_vm" "vm1" {
  resource_group_name = var.rg_name
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = azurerm_linux_virtual_machine.linux_vm[0].id
  backup_policy_id    = var.backup_policy_id
  depends_on = [
      azurerm_linux_virtual_machine.linux_vm
  ]
}

resource "azurerm_backup_protected_vm" "vm2" {
  resource_group_name = var.rg_name
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = azurerm_linux_virtual_machine.linux_vm[1].id
  backup_policy_id    = var.backup_policy_id
  depends_on = [
      azurerm_linux_virtual_machine.linux_vm
  ]
}
