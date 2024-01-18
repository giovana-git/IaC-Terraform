variable "cluster_identifier" {
  type    = string
  default = null
}

variable "availability_zones" {
  type    = list(string)
  default = null
}

variable "db_username" {
  type    = string
  default = null
}

variable "backup_retention" {
  type    = number
  default = null
}

variable "backup_window" {
  type    = string
  default = null
}

variable "secret_name" {
  type    = string
  default = null
}

variable "engine" {
  type    = string
  default = null
}

variable "engine_version" {
  type    = string
  default = null
}

variable "instance_identifier" {
  type    = string
  default = null
}

variable "instance_class" {
  type    = string
  default = null
}

variable "security_group_name" {
  type    = string
  default = null
}

variable "db_subnet_group" {
  type    = string
  default = null
}

variable "skip_final_snapshot" {
  type    = bool
  default = null
}

variable "parameter_group_family" {
  type    = string
  default = null
}

variable "parameter_group_name" {
  type    = string
  default = null
}

variable "parameters" {
  type    = list(map(string))
  default = []
}

variable "subnet_ids" {}


variable "vpc_id" {}

variable "vpc_cidr_block" {}