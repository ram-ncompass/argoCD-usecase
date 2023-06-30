terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.21.1"
    }
  }
}

provider "kubernetes" {
  config_path = var.config_path
  config_context = var.config_context
  host = aws_eks_cluster.cluster.endpoint
}

provider "helm" {
  kubernetes {
        config_path = var.config_path
        config_context = var.config_context
        host = aws_eks_cluster.cluster.endpoint
        cluster_ca_certificate = base64decode(aws_eks_cluster.cluster.certificate_authority[0].data)
        exec {
          api_version = "client.authentication.k8s.io/v1beta1"
          args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.cluster.id]
          command     = "aws"
        }
    }
}