resource "aws_eks_cluster" "cluster-eks" {

  name     = "cluster-${var.tag["Name"]}"
  role_arn = aws_iam_role.role-eks-cluster.arn
  version  = "1.24"

  vpc_config {
    subnet_ids = var.id_subnets
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController
  ]
}

resource "aws_eks_node_group" "node-eks" {

  node_group_name = "node-${var.tag["Name"]}"
  cluster_name    = aws_eks_cluster.cluster-eks.id
  node_role_arn   = aws_iam_role.role-eks-node.arn
  subnet_ids      = var.id_subnets
  instance_types  = ["t3.micro"]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly
  ]
}