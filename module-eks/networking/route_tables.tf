#   INTERNET GATEWAY

resource "aws_internet_gateway" "igw-eks" {

  vpc_id = aws_vpc.vpc-eks.id

  tags = {
    "Name"       = "${var.tag["Name"]}"
    "Enviroment" = "${var.tag["Enviroment"]}"
    "Owner"      = "${var.tag["Owner"]}"
  }
}

#   PUBLIC ROUTE TABLE

resource "aws_route_table" "public-route-table" {

  vpc_id = aws_vpc.vpc-eks.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-eks.id
  }

  tags = {
    "Name"       = "public-route-${var.tag["Name"]}"
    "Enviroment" = "${var.tag["Enviroment"]}"
    "Owner"      = "${var.tag["Owner"]}"
  }
}

#   ASSOCIATION PUBLIC ROUTE TABLE

resource "aws_route_table_association" "ass-public-route-table" {

  count          = length(var.public_subnets)
  route_table_id = aws_route_table.public-route-table.id
  subnet_id      = element(aws_subnet.public-subnets.*.id, count.index)
}


#   ELASTIC IP

resource "aws_eip" "eip-nat" {

  vpc = true

  tags = {
    "Name"       = "eip-${var.tag["Name"]}"
    "Enviroment" = "${var.tag["Enviroment"]}"
    "Owner"      = "${var.tag["Owner"]}"
  }
}

#   NAT GATEWAY

resource "aws_nat_gateway" "nat-eks" {

  count         = 1
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = element(aws_subnet.public-subnets.*.id, count.index)

  tags = {
    "Name"       = "nat-${var.tag["Name"]}"
    "Enviroment" = "${var.tag["Enviroment"]}"
    "Owner"      = "${var.tag["Owner"]}"
  }
}

#   PRIVATE ROUTE TABLE

resource "aws_route_table" "private-route-table" {

  count  = 1
  vpc_id = aws_vpc.vpc-eks.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = element(aws_nat_gateway.nat-eks.*.id, count.index)
  }

  tags = {
    "Name"       = "private-route-${var.tag["Name"]}"
    "Enviroment" = "${var.tag["Enviroment"]}"
    "Owner"      = "${var.tag["Owner"]}"
  }

  depends_on = [
    aws_nat_gateway.nat-eks
  ]
}

#   ASSOCIATION PRIVATE ROUTE TABLE

resource "aws_route_table_association" "ass-private-route-table" {

  count          = length(var.private_subnets)
  route_table_id = element(aws_route_table.private-route-table.*.id, count.index)
  subnet_id      = element(aws_subnet.private-subnets.*.id, count.index)
}
