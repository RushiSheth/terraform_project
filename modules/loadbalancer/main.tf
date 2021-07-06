resource "azurerm_lb" "assignment1-lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = var.public_ip_address_ids
    }
    tags = var.tags
}