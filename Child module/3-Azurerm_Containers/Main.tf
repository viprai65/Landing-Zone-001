data "azurerm_storage_account" "stg" {
  for_each            = var.container
  name                = each.value.storage_account_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_storage_container" "container" {
  for_each = var.container

  name                  = each.value.name
  storage_account_id    = data.azurerm_storage_account.stg[each.key].id
  container_access_type = each.value.container_access_type
}
