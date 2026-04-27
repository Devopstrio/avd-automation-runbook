# Devopstrio AVD Automation Runbook
# Foundation Infrastructure as Code
# Target: Azure RM

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90"
    }
  }
}

provider "azurerm" {
  features {}
}

# 1. Resource Group
resource "azurerm_resource_group" "automation_rg" {
  name     = "rg-avd-automation-prd"
  location = "uksouth"
  tags = {
    Environment = "Production"
    Platform    = "AVD-Automation"
  }
}

# 2. Azure Automation Account
resource "azurerm_automation_account" "avd_auto_account" {
  name                = "aa-avd-ops-prd"
  location            = azurerm_resource_group.automation_rg.location
  resource_group_name = azurerm_resource_group.automation_rg.name
  sku_name            = "Basic"

  identity {
    type = "SystemAssigned"
  }
}

# 3. Log Analytics Workspace (Ops Sink)
resource "azurerm_log_analytics_workspace" "avd_logs" {
  name                = "law-avd-ops-prd"
  location            = azurerm_resource_group.automation_rg.location
  resource_group_name = azurerm_resource_group.automation_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# 4. Azure Key Vault (Secret Store)
resource "azurerm_key_vault" "avd_vault" {
  name                        = "kv-avd-ops-secrets-prd"
  location                    = azurerm_resource_group.automation_rg.location
  resource_group_name         = azurerm_resource_group.automation_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = "ad4666f2-7f21-4f11-9a74-9844002621dd" # Mock tenant
  sku_name                    = "standard"

  purge_protection_enabled = false
}

# 5. Managed PostgreSQL (Platform Meta Database)
resource "azurerm_postgresql_flexible_server" "avd_db" {
  name                   = "psql-avd-ops-meta-prd"
  resource_group_name    = azurerm_resource_group.automation_rg.name
  location               = azurerm_resource_group.automation_rg.location
  version                = "15"
  delegated_subnet_id    = null # Use Public access for demo, change for Prod
  administrator_login    = "avdadmin"
  administrator_password = "SecurePassword123!" # In real scenario, use KeyVault

  storage_mb = 32768
  sku_name   = "GP_Standard_D2s_v3"
}

# Outputs
output "automation_account_id" {
  value = azurerm_automation_account.avd_auto_account.id
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.avd_logs.id
}
