resource "azurerm_resource_group" "jobs_r" {
  name     = "jobs-rg"
  location = "East US"
}

resource "azurerm_storage_account" "jobs" {
  depends_on               = [azurerm_resource_group.jobs_r]
  name                     = "jobs987654321"
  resource_group_name      = azurerm_resource_group.jobs_r.name
  location                 = azurerm_resource_group.jobs_r.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "jobs_c" {
  depends_on             = [azurerm_storage_account.jobs]
  name                   = "jobs-c"
  storage_account_id     = azurerm_storage_account.jobs.id
  container_access_type  = "private"
}