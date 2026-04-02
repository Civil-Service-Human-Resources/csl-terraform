terraform {
  required_version = "~> 1.14.8"
  backend "azurerm" {
    storage_account_name = "lpgterraformsecure"
    container_name       = "tfstatesecure"
    key                  = "infrastructure.terraform.tfstate"
    resource_group_name  = "lpgterraform"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
}

module "subscription" {
  source            = "../../modules/subscription"
  subscription_name = "CSL-Production"
}

provider "azurerm" {
  features {}
  subscription_id = module.subscription.subscription_id
}
