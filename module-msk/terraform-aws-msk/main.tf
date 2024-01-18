resource "aws_msk_cluster" "kafka_cluster" {

  cluster_name  = var.cluster_name
  kafka_version = var.cluster_version

  number_of_broker_nodes = var.node_numbers

  broker_node_group_info {
    instance_type   = var.instance_type
    client_subnets  = var.subnet_ids
    security_groups = var.security_groups_ids

    storage_info {
      ebs_storage_info {
        volume_size = var.volume_size
      }
    }
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = var.encryption_at_rest_kms_key_arn
  }
}

resource "aws_kms_key" "kafka" {

  description = "Chave KMS para o Kafka"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "key-consolepolicy-3",
  "Statement": [
    {
      "Sid": "Enable IAM User Permissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY
}