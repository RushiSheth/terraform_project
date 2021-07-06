resource "azurerm_recovery_services_vault" "assignment1-vault" {
  name                = var.recovery_service_vault_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Standard"
  soft_delete_enabled = true

  tags = var.tags
}

resource "azurerm_log_analytics_workspace" "assignment1-workspace" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = var.tags
}


resource "azurerm_storage_account" "assignment1-storage-account" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_storage_container" "assignment1-storage-container" {
  name                  = var.storage_container_name
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "assignment1-storage-blob" {
  name                   = var.storage_blob_name
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = "Block"
  source                 = "some-local-file.zip"
}

