terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.90.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "githubactions"
    storage_account_name = "githubactionscicd"
    container_name       = "terraform"
    key                  = "workload_one.tfstate"
  }
}

provider "azurerm" {
  features {}
}
