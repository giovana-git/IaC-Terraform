module "aurora_rds" {
  source = "./terraform-aws-rds"

  cluster_identifier  = "aurora-cluster"
  engine              = "aurora-mysql"
  engine_version      = "8.0.mysql_aurora.3.02.3"
  availability_zones  = ["us-east-1a", "us-east-1b"]
  db_subnet_group     = "db-subnets"
  db_username         = "admin"
  instance_class      = "db.r6g.large"
  instance_identifier = "aurora-instance"

  vpc_id              = "vpc-080b0b7df592bc32b"
  subnet_ids          = ["subnet-045006f1776b24281", "subnet-0c687ecff0fdd1fe8"]
  vpc_cidr_block      = "10.0.0.0/16"
  skip_final_snapshot = true

  parameter_group_family = "aurora-mysql8.0"
  parameter_group_name   = "aurora-parameter-group"

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_connection"
      value = "utf8mb4"
    },
    {
      name  = "character_set_database"
      value = "utf8mb4"
    },
    {
      name  = "character_set_results"
      value = "utf8mb4"
    },
    {
      name  = "collation_connection"
      value = "utf8mb4_0900_ai_ci"
    }
  ]
}