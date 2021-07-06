resource "azurerm_availability_set" "windows_avs" {
  name                = var.windows_availability_set
  location            = var.location
  resource_group_name = var.rg_name

  tags = var.tags
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  name = var.windows_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.windows_vm_size
  admin_username      = var.vm_admin_user
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.windows_nic.id
  ]

  

  os_disk {
    name = "win-os_disk"
    caching              = var.windows_os_disk_attr.os_caching
    storage_account_type = var.windows_os_disk_attr.os_storage_Account_type
  }

  source_image_reference {
    publisher = var.windows_os_disk_info.os_publisher
    offer     = var.windows_os_disk_info.os_offer
    sku       = var.windows_os_disk_info.os_sku
    version   = var.windows_os_disk_info.os_version
  }
  tags = var.tags
  lifecycle {
  }
}

resource "azurerm_network_interface" "windows_nic" {
  name                = "win-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_pip.id
  }
  tags = var.tags
  lifecycle {
   
  }
}

resource "azurerm_public_ip" "windows_pip" {
  name                = "win-pip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
  tags                = var.tags
  lifecycle {
    
  }
}