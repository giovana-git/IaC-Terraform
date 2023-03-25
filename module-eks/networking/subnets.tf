resource "aws_subnet" "private_subnets" {

  count                   = 2
  vpc_id                  = aws_vpc.vpc-eks.id
  cidr_block              = var.private_subnets[count.index]
  map_public_ip_on_launch = false
  availability_zone       = var.azs[count.index]

  tags = {
    "Name"       = "private-subnet-${var.azs[count.index]}"
    "Enviroment" = "${var.tag["Enviroment"]}"
    "Area"       = "${var.tag["Area"]}"
    "Owner"      = "${var.tag["Owner"]}"
  }
}

resource "aws_subnet" "public-subnets" {

  count                   = 2
  vpc_id                  = aws_vpc.vpc-eks.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    "Name"       = "public-subnet-${var.tag["Name"]}"
    "Enviroment" = "${var.tag["Enviroment"]}"
    "Area"       = "${var.tag["Area"]}"
    "Owner"      = "${var.tag["Owner"]}"
  }
}