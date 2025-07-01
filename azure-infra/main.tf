provider "azurerm" {
  features {}
}

module "rg" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "storage_1" {
  source              = "./modules/storage_account"
  storage_account_name = var.storage_account_name_1
  resource_group_name  = module.rg.resource_group_name
  location             = module.rg.location
}

module "file_share_1" {
  source               = "./modules/file_share"
  file_share_name      = var.file_share_name_1
  storage_account_name = module.storage_1.storage_account_name
  share_quota_gb       = var.share_quota_1
}

module "storage_2" {
  source              = "./modules/storage_account"
  storage_account_name = var.storage_account_name_2
  resource_group_name  = module.rg.resource_group_name
  location             = module.rg.location
}

module "file_share_2" {
  source               = "./modules/file_share"
  file_share_name      = var.file_share_name_2
  storage_account_name = module.storage_2.storage_account_name
  share_quota_gb       = var.share_quota_2
}
