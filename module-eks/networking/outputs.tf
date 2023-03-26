output "vpc_id" {
  value = aws_vpc.vpc-eks.id
}

output "subnets_id" {
  value = [
    aws_subnet.public-subnets.0.id,
    aws_subnet.public-subnets.1.id,
    aws_subnet.private-subnets.0.id,
    aws_subnet.private-subnets.1.id
  ]
}