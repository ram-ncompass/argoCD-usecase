resource "null_resource" "add_eks_charts_repo" {
  provisioner "local-exec" {
    command = "helm repo add eks https://aws.github.io/eks-charts"
  }
  depends_on = [ kubernetes_service_account.aws_load_balancer_controller ]
}

resource "null_resource" "helm_repo_update" {
  provisioner "local-exec" {
    command = "helm repo update"
  }
  depends_on = [null_resource.add_eks_charts_repo]
}

resource "helm_release" "aws_load_balancer_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"

  values = [
    <<EOF
    region: ${var.region}
    vpcId: ${var.vpc_id}
    clusterName: ram-cluster
    serviceAccount:
      create: false
      name: aws-load-balancer-controller
    EOF
  ]
  depends_on = [ null_resource.helm_repo_update ]
}
