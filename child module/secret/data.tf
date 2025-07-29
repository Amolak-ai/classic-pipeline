data "azurerm_key_vault" "kv" {
  name                = "pittu-keyvault"
  resource_group_name = "kittu-rg"
}
