##################################################################### 
####################### ec2 Instance node group #####################

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "ram-node-group"
  node_role_arn   = aws_iam_role.node_group_role.arn
  subnet_ids = [var.subnets_id[0], var.subnets_id[1]]

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 5
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_group_role_WorkerNodePolicy,
    aws_iam_role_policy_attachment.node_group_role_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node_group_role_AmazonEC2ContainerRegistryReadOnly,
  ]
  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }
}

##################################################################### 
####################### Fargate node group #####################

# resource "aws_eks_fargate_profile" "eks_fargate" {
#   cluster_name           = aws_eks_cluster.cluster.name
#   fargate_profile_name   = "ram-fargate-group"
#   pod_execution_role_arn = aws_iam_role.eks_fargate_role.arn
#   subnet_ids             = [var.subnets_id[2], var.subnets_id[3]]

#   selector {
#     namespace = var.namespaces[0]
#   }

#   selector {
#     namespace = var.namespaces[1]
#   }
# }