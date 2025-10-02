variable "storage_account_name"{
    description = "The name of the storage account. Must be between 3 and 24 characters in length and use numbers and lower-case letters only."
    type        = string
}
variable "resource_group_name"{
    description = "The name of the resource group in which to create the storage account."
    type        = string
}
variable "storage_account_location"{
    description = "The Azure location where the storage account should be created."
    type        = string
}
variable "account_tier"{
    description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium."
    type        = string
}
variable "account_replication_type"{
    description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS and GZRS."
    type        = string
}