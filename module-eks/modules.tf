module "k8s" {

  source = "./k8s"

  vpc_id     = module.networking.vpc_id
  id_subnets = module.networking.subnets_id
}

module "networking" {
  source = "./networking"
}
