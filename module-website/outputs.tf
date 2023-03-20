# value = module.[nome-do-módulo].[nome-do-output-do-módulo-child]

output "id_bucket" {
  value = module.s3.bucket_id
}

output "domain_name_bucket" {
  value = module.s3.regional_domain_name
}