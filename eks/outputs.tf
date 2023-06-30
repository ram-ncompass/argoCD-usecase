output "cluster_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_load_balancer_controller_role_arn" {
  value = aws_iam_role.aws_load_balancer_controller_role.arn
}
