resource "kubernetes_service_account" "aws_load_balancer_controller" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"

    labels = {
      "app.kubernetes.io/component" = "controller"

      "app.kubernetes.io/name" = "aws-load-balancer-controller"
    }

    annotations = {
      "eks.amazonaws.com/role-arn" = "arn:aws:iam::${var.account_id}:role/ram-AmazonEKSLoadBalancerControllerRole"
    }
  }
  depends_on = [ aws_eks_cluster.cluster ]
}

