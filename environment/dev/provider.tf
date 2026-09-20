terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.6.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "anqit_rg"
    storage_account_name = "anqitstorage"
    container_name       = "tfstate"
    key                  = "monolithic.tfstate"
    }
  }
  provider "azurerm" {
    features {}
  }


