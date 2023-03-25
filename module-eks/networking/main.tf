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
