resource "aws_eks_addon" "coredns_addon" {
  cluster_name = aws_eks_cluster.cluster.name
  addon_name   = "coredns"
  addon_version               = "v1.10.1-eksbuild.1"

  configuration_values = jsonencode({
    replicaCount = 2
    resources = {
      limits = {
        cpu    = "100m"
        memory = "150Mi"
      }
      requests = {
        cpu    = "100m"
        memory = "150Mi"
      }
    }
  })
  depends_on = [ helm_release.aws_load_balancer_controller ]
}