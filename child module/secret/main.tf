resource "azurerm_key_vault_secret" "username" {
  name         = var.username_name
  value        = var.username
  key_vault_id = data.azurerm_key_vault.kv.id
}
resource "azurerm_key_vault_secret" "password" {
  name         = var.password_name
  value        = var.password
  key_vault_id = data.azurerm_key_vault.kv.id
}


 