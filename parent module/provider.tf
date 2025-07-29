terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.37.0"
    }
  }
backend "azurerm" {
    resource_group_name  = "rgamak"
    storage_account_name = "amakstg"
    container_name       = "amakcontainer"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "5878055b-ed6d-4f89-b493-40fc80beaded"
}
