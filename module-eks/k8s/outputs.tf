output "arn_cluster" {
  value = aws_eks_cluster.cluster-eks.arn
}

output "role_eks_arn" {
  value = aws_iam_role.role-eks-cluster.arn
}