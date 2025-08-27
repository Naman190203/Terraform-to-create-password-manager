terraform {
  required_version = ">= 1.10.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.71, < 5.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.1, < 4.0.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = ">= 2.2.0, < 3.0.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9"
    }
  }
}

provider "azapi" {
  # Configuration options
}

provider "azurerm" {
  features {}
  subscription_id = "ba9fa6e9-4569-414a-9db7-a25481153a24"   
}


data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg
}


resource "random_password" "password" {
  for_each = toset(var.secrets)
  length    = 20
  special   = true
  upper     = true
  numeric   = true
  
}


resource "time_offset" "expiry" {
  offset_days = 30
}


resource "azurerm_key_vault_secret" "passwordstorage" {
  for_each     = random_password.password 
  name         = each.key
  value        = each.value.result
  key_vault_id = data.azurerm_key_vault.key_vault.id
  expiration_date = time_offset.expiry.rfc3339

}
