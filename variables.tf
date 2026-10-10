variable "fsx_file_caches" {
  description = <<EOT
Map of fsx_file_caches, attributes below
Required:
    - file_cache_type
    - file_cache_type_version
    - storage_capacity
    - subnet_ids
Optional:
    - copy_tags_to_data_repository_associations
    - kms_key_id
    - region
    - security_group_ids
    - tags
    - tags_all
    - data_repository_association (block):
        - data_repository_path (required)
        - data_repository_subdirectories (optional)
        - file_cache_path (required)
        - nfs (optional, block):
            - dns_ips (optional)
            - version (required)
        - tags (optional)
    - lustre_configuration (block):
        - deployment_type (required)
        - metadata_configuration (required, block):
            - storage_capacity (required)
        - per_unit_storage_throughput (required)
        - weekly_maintenance_start_time (optional)
EOT

  type = map(object({
    file_cache_type                           = string
    file_cache_type_version                   = string
    storage_capacity                          = number
    subnet_ids                                = list(string)
    copy_tags_to_data_repository_associations = optional(bool)
    kms_key_id                                = optional(string)
    region                                    = optional(string)
    security_group_ids                        = optional(set(string))
    tags                                      = optional(map(string))
    tags_all                                  = optional(map(string))
    data_repository_association = optional(list(object({
      data_repository_path           = string
      data_repository_subdirectories = optional(set(string))
      file_cache_path                = string
      nfs = optional(list(object({
        dns_ips = optional(set(string))
        version = string
      })))
      tags = optional(map(string))
    })))
    lustre_configuration = optional(list(object({
      deployment_type = string
      metadata_configuration = list(object({
        storage_capacity = number
      }))
      per_unit_storage_throughput   = number
      weekly_maintenance_start_time = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.fsx_file_caches : (
        v.data_repository_association == null || (length(v.data_repository_association) <= 8)
      )
    ])
    error_message = "Each data_repository_association list must contain at most 8 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_file_caches : (
        v.lustre_configuration == null || alltrue([for item in v.lustre_configuration : (length(item.metadata_configuration) >= 1 && length(item.metadata_configuration) <= 8)])
      )
    ])
    error_message = "Each metadata_configuration list must contain between 1 and 8 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_file_caches : (
        v.data_repository_association == null || alltrue([for item in v.data_repository_association : ((length(item.data_repository_path) >= 3 && length(item.data_repository_path) <= 4357))])
      )
    ])
    error_message = "all of: must be between 3 and 4357 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_file_caches : (
        v.data_repository_association == null || alltrue([for item in v.data_repository_association : (item.data_repository_subdirectories == null || (alltrue([for x in item.data_repository_subdirectories : (length(x) >= 1 && length(x) <= 4096)])))])
      )
    ])
    error_message = "all of: must be between 1 and 4096 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_file_caches : (
        v.data_repository_association == null || alltrue([for item in v.data_repository_association : ((length(item.file_cache_path) >= 1 && length(item.file_cache_path) <= 4096))])
      )
    ])
    error_message = "all of: must be between 1 and 4096 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_file_caches : (
        v.data_repository_association == null || alltrue([for item in v.data_repository_association : (item.nfs == null || alltrue([for item in item.nfs : (item.dns_ips == null || (alltrue([for x in item.dns_ips : (length(x) >= 7 && length(x) <= 15) && (can(regex("^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$", x)))])))]))])
      )
    ])
    error_message = "all of: must be between 7 and 15 characters; invalid pattern"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_file_caches : (
        (length(v.file_cache_type_version) >= 1 && length(v.file_cache_type_version) <= 20) && (can(regex("^[0-9](.[0-9]*)*$", v.file_cache_type_version)))
      )
    ])
    error_message = "all of: must be between 1 and 20 characters; invalid pattern"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_file_caches : (
        v.lustre_configuration == null || alltrue([for item in v.lustre_configuration : (alltrue([for item in item.metadata_configuration : ((item.storage_capacity >= 0 && item.storage_capacity <= 2147483647))]))])
      )
    ])
    error_message = "all of: must be between 0 and 2147483647"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_file_caches : (
        v.lustre_configuration == null || alltrue([for item in v.lustre_configuration : ((item.per_unit_storage_throughput >= 12 && item.per_unit_storage_throughput <= 1000))])
      )
    ])
    error_message = "all of: must be between 12 and 1000"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_file_caches : (
        v.lustre_configuration == null || alltrue([for item in v.lustre_configuration : (item.weekly_maintenance_start_time == null || ((length(item.weekly_maintenance_start_time) >= 7 && length(item.weekly_maintenance_start_time) <= 7) && (can(regex("^[1-7]:([01]\\d|2[0-3]):?([0-5]\\d)$", item.weekly_maintenance_start_time)))))])
      )
    ])
    error_message = "all of: must be between 7 and 7 characters; invalid pattern"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_file_caches : (
        (v.storage_capacity >= 0 && v.storage_capacity <= 2147483647)
      )
    ])
    error_message = "all of: must be between 0 and 2147483647"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

