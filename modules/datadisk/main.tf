resource "azurerm_managed_disk" "assignment1-disk1" {
  name                 = var.linux_datadisk1_name
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags = var.tags
}

resource "azurerm_managed_disk" "assignment1-disk2" {
  name                 = var.linux_datadisk2_name
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags = var.tags
}

resource "azurerm_managed_disk" "assignment1-disk3" {
  name                 = var.win_datadisk3_name
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "assignment1-attach-disk1" {
  managed_disk_id    = azurerm_managed_disk.assignment1-disk1.id
  virtual_machine_id = var.linux_vm1_id
  lun                = "10"
  caching            = "ReadWrite"
  depends_on = [
      azurerm_managed_disk.assignment1-disk1
  ]
}

resource "azurerm_virtual_machine_data_disk_attachment" "assignment1-attach-disk2" {
  managed_disk_id    = azurerm_managed_disk.assignment1-disk2.id
  virtual_machine_id = var.linux_vm2_id
  lun                = "10"
  caching            = "ReadWrite"
  depends_on = [
      azurerm_managed_disk.assignment1-disk2
  ]
}

resource "azurerm_virtual_machine_data_disk_attachment" "assignment1-attach-disk3" {
  managed_disk_id    = azurerm_managed_disk.assignment1-disk3.id
  virtual_machine_id = var.windows_id
  lun                = "10"
  caching            = "ReadWrite"
  depends_on = [
      azurerm_managed_disk.assignment1-disk3
  ]
}