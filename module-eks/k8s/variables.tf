variable "vpc_id" {}

variable "id_subnets" {}

variable "tag" {

  type = map(any)
  default = {
    Name       = "gc-tf"
    Enviroment = "Terraform"
    Owner      = "giovana.costa"
  }
}

variable "azs" {

  type    = list(string)
  default = ["us-east-2a", "us-east-2b"]
}