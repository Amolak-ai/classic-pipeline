data "azurerm_key_vault" "kv" {
  name                = "tittu-keyvault"
  resource_group_name = "kittu-rg"
}
data "azurerm_key_vault_secret" "username" {
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.kv.id
}
data "azurerm_key_vault_secret" "password" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.kv.id
}