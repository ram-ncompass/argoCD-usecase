resource "aws_iam_role_policy_attachment" "cluster_role_ClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = var.cluster_role_name
}

resource "aws_iam_role_policy_attachment" "cluster_role_AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = var.cluster_role_name
}