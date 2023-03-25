# O bloco Module é para referenciar um módulo, seja ele remoto ou local


module "k8s" {
  #  source = origem desse módulo, pode ser público (/registry/aws/vpc) ou local (./module/eks)
  #  version = versão do módulo 

  source = "./k8s"
  vpc_id = module.networking.vpc_id
}

module "networking" {
  source = "./networking"
}
