terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# terraform {
#   backend "azurerm" {
#     resource_group_name  = "insider_rg1"
#     storage_account_name = "insiderstt"
#     container_name       = "container1"
#     key                  = "terraform.tfstate"
#   }
# }