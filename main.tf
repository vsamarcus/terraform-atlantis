resource "azurerm_resource_group" "this" {
  name     = "network"
  location = "eastus"
}

resource "azurerm_virtual_network" "this" {
  name                = "virtualnetwork"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_subnet" "this" {
  name                 = "subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.10.0.0/24"]
}
