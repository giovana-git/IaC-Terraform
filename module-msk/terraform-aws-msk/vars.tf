variable "subnet_ids" {}

variable "security_groups_ids" {}

variable "cluster_name" {
  type    = string
  default = null
}

variable "cluster_version" {
  type    = string
  default = null
}

variable "instance_type" {
  type    = string
  default = null
}

variable "volume_size" {
  type    = string
  default = null
}

variable "node_numbers" {
  type    = number
  default = null
}

variable "encryption_at_rest_kms_key_arn" {
  type    = string
  default = null
}