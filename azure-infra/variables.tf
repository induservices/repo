variable "resource_group_name" {
  type    = string
  default = "rg_induservices_files"
}

variable "location" {
  type    = string
  default = "Switzerland North"
}

# Storage account 1
variable "storage_account_name_1" {
  type    = string
  default = "socrepo1"
}

variable "file_share_name_1" {
  type    = string
  default = "backups"
}

variable "share_quota_1" {
  type    = number
  default = 100
}

# Storage account 2
variable "storage_account_name_2" {
  type    = string
  default = "dronedeploybck"
}

variable "file_share_name_2" {
  type    = string
  default = "dronedeployshare"
}

variable "share_quota_2" {
  type    = number
  default = 200
}
