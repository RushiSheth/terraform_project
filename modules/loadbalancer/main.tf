resource "azurerm_lb" "assignment1_lb" {
  name                = "TestLoadBalancer"
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.assignment1_pip.id
  }
}

resource "azurerm_public_ip" "assignment1_pip" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

resource "azurerm_lb_backend_address_pool" "assignment1_add_pool" {
  loadbalancer_id = azurerm_lb.assignment1_lb.id
  name            = "BackEndAddressPool"
}


resource "azurerm_lb_rule" "assignment1_lb_rule" {
  resource_group_name            = var.rg_name
  loadbalancer_id                = azurerm_lb.assignment1_lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
}

resource "azurerm_lb_probe" "assignment1_lb_probe" {
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.assignment1_lb.id
  name                = "ssh-running-probe"
  port                = 22
}

resource "azurerm_network_interface_backend_address_pool_association" "assignment1_add_pool_asso1" {
  network_interface_id    = var.nic_id_1
  ip_configuration_name   = "testconfiguration1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.assignment1_add_pool.id
}

resource "azurerm_network_interface_backend_address_pool_association" "assignment1_add_pool_asso2" {
  network_interface_id    = var.nic_id_2
  ip_configuration_name   = "testconfiguration1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.assignment1_add_pool.id
}