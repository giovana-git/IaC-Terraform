variable "tag" {
  type = map(any)
  default = {
    Name       = "gc-tf"
    Enviroment = "Terraform"
    Area       = "Sust"
    Owner      = "giovana.costa"
  }
}

variable "cidr_block" {
  type    = string
  default = "172.16.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["172.16.1.0/24", "172.16.2.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["172.16.3.0/24", "172.16.4.0/24"]
}

variable "azs" {
  type    = list(string)
  default = ["us-east-2a", "us-east-2b"]
}