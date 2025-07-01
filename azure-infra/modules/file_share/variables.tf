variable "file_share_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "share_quota_gb" {
  type    = number
  default = 100
}
