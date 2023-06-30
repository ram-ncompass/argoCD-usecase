resource "aws_security_group" "cluster_sg" {
  name        = "ram-cluster-sg"
  description = "Security group for my EKS cluster"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = var.vpc_id
}