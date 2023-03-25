# Bloco resource é onde você irá definir suas configurações no seu provider definido. Os parâmetros para este bloco depende do recurso que você estará criando, por exemplo uma instancia (instance_type = tal)

resource "aws_vpc" "vpc-eks" {

  cidr_block         = var.cidr_block
  enable_dns_support = true

  tags = {
    "Name"       = "vpc-${var.tag["Name"]}"
    "Enviroment" = "${var.tag["Enviroment"]}"
    "Area"       = "${var.tag["Area"]}"
    "Owner"      = "${var.tag["Owner"]}"
  }
}
