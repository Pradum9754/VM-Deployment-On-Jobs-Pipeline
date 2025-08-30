terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "jobs-rg"
    storage_account_name = "jobs987654321"
    container_name       = "jobs-c"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "4a8937a7-b294-4a1f-8d31-79bbb1a4c17f"
}