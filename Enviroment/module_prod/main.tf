module "rg" {
  source = "../../prod/azurerm_resource_group"
  rgs    = var.resource_group

}

module "storage_account" {
  source           = "../../prod/azurerm_storage_group"
  storage_accounts = var.storages
  depends_on = [ module.rg ]

}


module "vnet" {
  source     = "../../prod/azurerm_vnet_group"
  vnet_group = var.vnet_groups
  depends_on = [ module.rg ]

}

module "subnet" {
  source       = "../../prod/azurerm_subnet_group"
  subnet_group = var.subnet_groups
  depends_on = [ module.vnet ]

}