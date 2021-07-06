resource "azurerm_resource_group" "assignment1-rg" {
  name     = var.rg_name
  location = var.location
  tags = var.tags
}