output "Service_vault_name" {
  value = azurerm_recovery_services_vault.assignment1-vault.name
}

output "Log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.assignment1-workspace.name
}

output "storage_account_name" {
  value = azurerm_storage_account.assignment1-sto-acc.name
}