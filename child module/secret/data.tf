data "azurerm_key_vault" "kv" {
  name                = "mittu-keyvault"
  resource_group_name = "kittu-rg"
}
