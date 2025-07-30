module "resource_group" {
  source      = "../child module/resource_group"
  rg_name     = "kittu-rg"
  rg_location = "centralus"
}
module "resource_group01" {
  source      = "../child module/resource_group"
  rg_name     = "pittu-rg"
  rg_location = "centralus"
}
module "vnet" {
  depends_on    = [module.resource_group]
  source        = "../child module/vnet"
  vnet_name     = "kittu-vnet"
  rg_name       = "kittu-rg"
  rg_location   = "centralus"
  address_space = ["10.0.0.0/16"]
}
module "subnet" {
  depends_on       = [module.vnet]
  source           = "../child module/subent"
  subnet_name      = "kittu-subnet"
  rg_name          = "kittu-rg"
  vnet_name        = "kittu-vnet"
  address_prefixes = ["10.0.1.0/24"]
}
module "vm" {
  depends_on     = [module.subnet, module.public_ip, module.keyvault, module.secret]
  source         = "../child module/virtual_machine"
  nic_name       = "kittu-nic"
  rg_location    = "centralus"
  rg_name        = "kittu-rg"
  vm_name        = "kittu-vm"
  vnet_name      = "kittu-vnet"
  subnet_name    = "kittu-subnet"
  public_ip_name = "kittu-public-ip"
  key_vault_name = "mittu-keyvault"
}
module "keyvault" {
  depends_on     = [module.resource_group]
  source         = "../child module/keyvault"
  key_vault_name = "mittu-keyvault"
  rg_name        = "kittu-rg"
  rg_location    = "centralus"
}
module "public_ip" {
  depends_on     = [module.resource_group, ]
  source         = "../child module/public_ip"
  public_ip_name = "kittu-public-ip"
  rg_name        = "kittu-rg"
  rg_location    = "centralus"
}
module "secret" {
  depends_on    = [module.resource_group, module.keyvault]
  source        = "../child module/secret"
  username_name = "vm-username"
  username      = "bogamboadmin"
  password_name = "vm-password"
  password      = "Password#54321"
}
module "sql_server" {
  depends_on  = [module.resource_group, module.secret]
  source      = "../child module/sql_server"
  server_name = "kittu-sql-server"
  rg_name     = "kittu-rg"
  rg_location = "centralus"

}
module "sql_database" {
  depends_on    = [module.sql_server]
  source        = "../child module/sql_database"
  database_name = "kittu-db"
  server_name   = "kittu-sql-server"
  rg_name       = "kittu-rg"
}
