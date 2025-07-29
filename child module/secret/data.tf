data "azurerm_key_vault" "kv" {
  name                = "tittu-keyvault"
  resource_group_name = "kittu-rg"
}