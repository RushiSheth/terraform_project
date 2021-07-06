resource "azurerm_virtual_network" "assignment1-vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_add_space
  location            = var.location
  resource_group_name = var.rg_name

  tags =  var.tags

}

resource "azurerm_subnet" "assignment1-subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.assignment1-vnet.name
  address_prefixes     = var.subnet_add_space
}

resource "azurerm_network_security_group" "assignment1-nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = 22
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "assignment1-nsga" {
  subnet_id                 = azurerm_subnet.assignment1-subnet.id
  network_security_group_id = azurerm_network_security_group.assignment1-nsg.id
}

