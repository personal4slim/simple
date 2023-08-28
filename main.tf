provider "azurerm" {
subscription_id="606e824b-aaf7-4b4e-9057-b459f6a4436d"
client_id="62ba6d2f-4192-4cf5-a00d-42328f7d7dfd"
tenant_id="104e77d4-81e7-4c16-ab44-935220bed6dd"
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
