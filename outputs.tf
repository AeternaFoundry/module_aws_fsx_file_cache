output "fsx_file_caches_id" {
  description = "Map of id values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.id if v.id != null && length(v.id) > 0 }
}
output "fsx_file_caches_arn" {
  description = "Map of arn values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "fsx_file_caches_copy_tags_to_data_repository_associations" {
  description = "Map of copy_tags_to_data_repository_associations values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.copy_tags_to_data_repository_associations if v.copy_tags_to_data_repository_associations != null }
}
output "fsx_file_caches_data_repository_association" {
  description = "Map of data_repository_association values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.data_repository_association if v.data_repository_association != null && length(v.data_repository_association) > 0 }
}
output "fsx_file_caches_data_repository_association_ids" {
  description = "Map of data_repository_association_ids values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.data_repository_association_ids if v.data_repository_association_ids != null && length(v.data_repository_association_ids) > 0 }
}
output "fsx_file_caches_dns_name" {
  description = "Map of dns_name values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.dns_name if v.dns_name != null && length(v.dns_name) > 0 }
}
output "fsx_file_caches_file_cache_id" {
  description = "Map of file_cache_id values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.file_cache_id if v.file_cache_id != null && length(v.file_cache_id) > 0 }
}
output "fsx_file_caches_file_cache_type" {
  description = "Map of file_cache_type values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.file_cache_type if v.file_cache_type != null && length(v.file_cache_type) > 0 }
}
output "fsx_file_caches_file_cache_type_version" {
  description = "Map of file_cache_type_version values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.file_cache_type_version if v.file_cache_type_version != null && length(v.file_cache_type_version) > 0 }
}
output "fsx_file_caches_kms_key_id" {
  description = "Map of kms_key_id values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.kms_key_id if v.kms_key_id != null && length(v.kms_key_id) > 0 }
}
output "fsx_file_caches_lustre_configuration" {
  description = "Map of lustre_configuration values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.lustre_configuration if v.lustre_configuration != null && length(v.lustre_configuration) > 0 }
}
output "fsx_file_caches_network_interface_ids" {
  description = "Map of network_interface_ids values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.network_interface_ids if v.network_interface_ids != null && length(v.network_interface_ids) > 0 }
}
output "fsx_file_caches_owner_id" {
  description = "Map of owner_id values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.owner_id if v.owner_id != null && length(v.owner_id) > 0 }
}
output "fsx_file_caches_region" {
  description = "Map of region values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.region if v.region != null && length(v.region) > 0 }
}
output "fsx_file_caches_security_group_ids" {
  description = "Map of security_group_ids values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.security_group_ids if v.security_group_ids != null && length(v.security_group_ids) > 0 }
}
output "fsx_file_caches_storage_capacity" {
  description = "Map of storage_capacity values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.storage_capacity if v.storage_capacity != null }
}
output "fsx_file_caches_subnet_ids" {
  description = "Map of subnet_ids values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.subnet_ids if v.subnet_ids != null && length(v.subnet_ids) > 0 }
}
output "fsx_file_caches_tags" {
  description = "Map of tags values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "fsx_file_caches_tags_all" {
  description = "Map of tags_all values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "fsx_file_caches_vpc_id" {
  description = "Map of vpc_id values across all fsx_file_caches, keyed the same as var.fsx_file_caches"
  value       = { for k, v in aws_fsx_file_cache.fsx_file_caches : k => v.vpc_id if v.vpc_id != null && length(v.vpc_id) > 0 }
}

