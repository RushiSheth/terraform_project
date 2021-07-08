resource "azurerm_lb" "assignment1_lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.assignment1_pip.id
  }
  depends_on = [
      azurerm_public_ip.assignment1_pip
  ]
}

resource "azurerm_public_ip" "assignment1_pip" {
  name                = var.public_ip_lb_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

resource "azurerm_lb_backend_address_pool" "assignment1_add_pool1" {
  loadbalancer_id = azurerm_lb.assignment1_lb.id
  name            = "BackEndAddressPool1"
  depends_on = [
      azurerm_lb.assignment1_lb
  ]
}

resource "azurerm_lb_backend_address_pool" "assignment1_add_pool2" {
  loadbalancer_id = azurerm_lb.assignment1_lb.id
  name            = "BackEndAddressPool2"
  depends_on = [
      azurerm_lb.assignment1_lb
  ]
}

resource "azurerm_lb_rule" "assignment1_lb_rule" {
  resource_group_name            = var.rg_name
  loadbalancer_id                = azurerm_lb.assignment1_lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
  depends_on = [
      azurerm_lb.assignment1_lb
  ]
}

resource "azurerm_lb_probe" "assignment1_lb_probe" {
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.assignment1_lb.id
  name                = "ssh-running-probe"
  port                = 22
  depends_on = [
      azurerm_lb.assignment1_lb
  ]
}

resource "azurerm_network_interface_backend_address_pool_association" "assignment1_add_pool_asso1" {
  network_interface_id    = var.nic_id_1
  ip_configuration_name   = var.ipconfig1
  backend_address_pool_id = azurerm_lb_backend_address_pool.assignment1_add_pool1.id
  depends_on = [
      azurerm_lb_backend_address_pool.assignment1_add_pool1
  ]
}

resource "azurerm_network_interface_backend_address_pool_association" "assignment1_add_pool_asso2" {
  network_interface_id    = var.nic_id_2
  ip_configuration_name   = var.ipconfig2
  backend_address_pool_id = azurerm_lb_backend_address_pool.assignment1_add_pool2.id
   depends_on = [
      azurerm_lb_backend_address_pool.assignment1_add_pool2
  ]
}