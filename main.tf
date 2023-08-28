terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example_rg" {
  name     = "my-resource-group"
  location = "East US"
}

resource "azurerm_app_service_plan" "example_plan" {
  name                = "my-app-service-plan"
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example_webapp" {
  name                = "p4s-webapp2"
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
  app_service_plan_id = azurerm_app_service_plan.example_plan.id

  site_config {
    always_on = true
  }

  app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "14"
  }
}
