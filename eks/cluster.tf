resource "aws_eks_cluster" "cluster" {
  name     = "ram-cluster"
  role_arn = var.cluster_iam_role
  version         = "1.27"

  vpc_config {
    subnet_ids = [var.subnets_id[0], var.subnets_id[1], var.subnets_id[2], var.subnets_id[3]]
    security_group_ids = [aws_security_group.cluster_sg.id]
  }
}
