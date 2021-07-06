output "Db_Server_Name" {
  value = azurerm_postgresql_server.assignment-1-db_server.name
}

output "Db_Name" {
  value = azurerm_postgresql_database.assignment-1-db-postgre.name
}