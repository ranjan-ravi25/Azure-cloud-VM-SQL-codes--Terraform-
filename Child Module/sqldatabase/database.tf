data "azurerm_mssql_server" "sqlserver" {
  name                = var.sql_name
  resource_group_name = var.resource_group_name

}

resource "azurerm_mssql_database" "example" {
  name         = var.sql_database_name 
  server_id    = data.azurerm_mssql_server.sqlserver.id
}