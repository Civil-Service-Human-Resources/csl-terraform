resource "azurerm_resource_group" "infrastructure_rg" {
  name     = "rg-devops-infrastructure"
  location = "UKSouth"
}

resource "azurerm_automation_account" "main" {
  name                = "acct-infra-automation"
  location            = azurerm_resource_group.infrastructure_rg.location
  resource_group_name = azurerm_resource_group.infrastructure_rg.name
  sku_name            = "Basic"

  identity {
    type = "SystemAssigned"
  }
}

