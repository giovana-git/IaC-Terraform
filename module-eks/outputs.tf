output "vpc_id" {
  value = module.networking.vpc_id
}

output "id_subnets" {
  value = module.networking.subnets_id
}

# output "cluster_arn" {
#   value = module.k8s.arn_cluster
# }