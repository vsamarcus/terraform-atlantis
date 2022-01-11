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

resource "azurerm_storage_account" "this" {
  name                = "storageaccount"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  account_kind             = "StorageV2"
  account_tier             = "Premium"
  account_replication_type = "LRS"
  access_tier              = "Hot"

  tags = {
    Terraform   = true
    Environment = "Staging"
    Owner       = "marcusv.sa@hotmail.com"
  }
}
