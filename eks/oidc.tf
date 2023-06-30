data "tls_certificate" "eks" {
    url = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}

# Create the IAM OIDC provider
resource "aws_iam_openid_connect_provider" "oidc_provider" {
  url             = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
}
