# Bloco Terraform - Bloco para definir as configurações do Terraform como a versão do mesmo, seus providers e suas respectivas versões...

terraform {
  #  required_providers = for specific your required provider, your source and your version
  #  required_version = for define a version specific of Terraform
  #  backend = for specific a remote backend (s3) of your configuration (.tfstate)
  #  cloud = storage your state in Terraform Cloud

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Bloco para definir seu provedor, no nosso caso a AWS. Através de API

provider "aws" {
  #  region = região da aws em que seus recursos serão provisionados
  #  alias = uma forma de utilizar mais de uma região para diferente recursos (provider = { aws.west })

  region = var.region
}

