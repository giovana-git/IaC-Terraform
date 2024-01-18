resource "aws_db_subnet_group" "subnet-group" {
  name       = var.db_subnet_group
  subnet_ids = var.subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_rds_cluster" "rds-cluster" {

  depends_on                      = [aws_db_subnet_group.subnet-group]
  engine                          = var.engine
  engine_version                  = var.engine_version
  cluster_identifier              = var.cluster_identifier
  availability_zones              = var.availability_zones
  master_username                 = var.db_username
  master_password                 = random_password.rds-password.result
  backup_retention_period         = var.backup_retention
  preferred_backup_window         = var.backup_window
  db_subnet_group_name            = var.db_subnet_group
  skip_final_snapshot             = var.skip_final_snapshot
  db_cluster_parameter_group_name = var.parameter_group_name
}

resource "aws_rds_cluster_instance" "cluster_instances" {

  depends_on           = [aws_rds_cluster.rds-cluster]
  count                = 1
  identifier           = var.instance_identifier
  cluster_identifier   = aws_rds_cluster.rds-cluster.id
  instance_class       = var.instance_class
  engine               = aws_rds_cluster.rds-cluster.engine
  engine_version       = aws_rds_cluster.rds-cluster.engine_version
  db_subnet_group_name = var.db_subnet_group
}

resource "random_password" "rds-password" {
  length           = 12
  special          = true
  override_special = "_!%^#"
}

resource "aws_secretsmanager_secret" "secret" {
  name = var.secret_name
}

resource "aws_secretsmanager_secret_version" "secret-version" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = random_password.rds-password.result
}

resource "aws_security_group" "rds" {
  name        = var.security_group_name
  description = "RDS"
  vpc_id      = var.vpc_id

  ingress {
    description = "VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.security_group_name}"
  }
}

resource "aws_rds_cluster_parameter_group" "cluster-parameter-group" {

  depends_on = [aws_rds_cluster.rds-cluster]
  name       = var.parameter_group_name
  family     = var.parameter_group_family # "aurora5.6"

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}
