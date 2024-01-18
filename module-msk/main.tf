module "msk_cluster" {
  source = "./terraform-aws-msk"

  cluster_name    = "cluster-msk"
  cluster_version = "3.3.1"
  node_numbers    = 2

  subnet_ids          = ["subnet-077ccf397cfce7f5e", "subnet-0b114ee4a9569443a"]
  instance_type       = "kafka.m5.large"
  security_groups_ids = ["sg-02da5a7fd046f7165"]

  volume_size = "10"
}