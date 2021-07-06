resource "azurerm_managed_disk" "assignment1-disk1" {
  name                 = "linuxvm-disk1"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags = var.tags
}

resource "azurerm_managed_disk" "assignment1-disk2" {
  name                 = "linuxvm-disk2"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags = var.tags
}

resource "azurerm_managed_disk" "assignment1-disk3" {
  name                 = "windowsvm-disk3"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "assignment1-attach-disk1" {
  managed_disk_id    = azurerm_managed_disk.assignment1-disk1.id
  virtual_machine_id = azurerm_virtual_machine.assignment1.id
  lun                = "10"
  caching            = "ReadWrite"
}

resource "azurerm_virtual_machine_data_disk_attachment" "assignment1-attach-disk2" {
  managed_disk_id    = azurerm_managed_disk.assignment1-disk2.id
  virtual_machine_id = azurerm_virtual_machine.assignment1.id
  lun                = "10"
  caching            = "ReadWrite"
}

resource "azurerm_virtual_machine_data_disk_attachment" "assignment1-attach-disk3" {
  managed_disk_id    = azurerm_managed_disk.assignment1-disk3.id
  virtual_machine_id = azurerm_virtual_machine.assignment1.id
  lun                = "10"
  caching            = "ReadWrite"
}