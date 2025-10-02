module "resource_group" {
  source                  = "../module/resourcegroup"
  resource_group_name     = "ridhu"
  resource_group_location = "west europe"
}

module "azurerm_storage_account" {
  depends_on =[module.resource_group]
  source                           = "../module/storage"
  storage_account_name             = "ridhustg47"
  resource_group_name              = "ridhu"
  storage_account_location         = "west europe"
   account_tier       = "Standard"
   account_replication_type = "LRS"
}
module "azurerm_virtual_network"  {
   depends_on =[module.resource_group]
    source = "../module/vnet"
  virtual_network_name                = "ridhuvnet"
  virtual_network_location            = "west europe"
  resource_group_name = "ridhu"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}
 
module "frontend_subnet"{
  depends_on = [module.azurerm_virtual_network]
  source = "../module/subnet"
  subnet_name          = "ridhusubnet1"
  resource_group_name  = "ridhu"
  virtual_network_name = "ridhuvnet"
  address_prefixes     = ["10.0.1.0/24"]
}
module "backend_subnet"{
  depends_on = [module.azurerm_virtual_network]
  source = "../module/subnet"
  subnet_name          = "ridhusubnet2"
  resource_group_name  = "ridhu"
  virtual_network_name = "ridhuvnet"
  address_prefixes     = ["10.0.2.0/24"]
}
module "azurerm_public_ip_frontend"  {
  source = "../module/public ip"  
  public_ip_name                = "pip22"
  resource_group_name = "ridhu"
  location            = "west europe"
  allocation_method   = "Static"
  
}

module "azurerm_public_ip_backend"  {
  source = "../module/public ip"  
  public_ip_name                = "pip44"
  resource_group_name = "ridhu"
  location            = "west europe"
  allocation_method   = "Static"
  
}
module "azurerm_linux_virtual_machine" {
  depends_on =[module.frontend_subnet]
  source = "../module/vm"
  network_interface_name = "ridhu_nic5"
  network_interface_location = "west europe"
  resource_group_name = "ridhu"
  vm_name                = "ravivm"
  location            = "west europe"
  vm_size                = "Standard_D2s_v3"
  admin_user      = "adminravi"
  admin_password =     "Ridhu@12345$"
  image_publisher = "Canonical"
  image_offer = "UbuntuServer"
  image_sku = "18.04-LTS"
  image_version = "latest"
  subnet_name          = "ridhusubnet1"
  virtual_network_name                = "ridhuvnet"
  public_ip_name                = "pip"
 }
module "azurerm_linux_virtual_machine1" {
  depends_on =[module.backend_subnet]
  source = "../module/vm"
  network_interface_name = "ridhu_nic3"
  network_interface_location = "west europe"
  resource_group_name = "ridhu"
  vm_name                = "ravivm1"
  location            = "west europe"
  vm_size                = "Standard_D2s_v3"
  admin_user      = "adminravi"
  admin_password =     "Ridhu@12345$"
  image_publisher = "Canonical"
  image_offer = "0001-com-ubuntu-server-focal"
  image_sku = "20_04-lts"
  image_version = "latest"
  subnet_name          = "ridhusubnet2"
  virtual_network_name                = "ridhuvnet"
  public_ip_name                = "pip1"
 }
  module "azurerm_mssql_server" {
  source =  "../module/sqlserver"
  sql_name                     =  "sqlravi1"
  resource_group_name          =  "ridhu"
  location                     =  "Canada Central"
  adminstrator_login           = "adminravi"
  administrator_login_password = "Ridhu@12345$"

  }
  module "azurerm_mssql_database"  {
  depends_on = [module.azurerm_mssql_server]
  source = "../module/sqldatabase"
  sql_database_name       = "sqldatabase"
  sql_name                     =  "sqlravi1"
  resource_group_name          =  "ridhu"
  }
