variable "subnets_id" {
}

variable "cluster_iam_role" {
  default = "arn:aws:iam::368355641188:role/AmazonEKSClusterRole"
}

variable "vpc_id" {
}

variable "cluster_role_name" {
  default = "AmazonEKSClusterRole"
}

variable "config_path" {
  default = "~/.kube/config"
}

variable "config_context" {
  default = "arn:aws:eks:us-east-2:368355641188:cluster/ram-cluster"
}

variable "region" {
  default = "us-east-2"
}

variable "account_id" {
  default = "368355641188"
}

variable "namespaces" {
  default = ["default", "kube-system"]
}
