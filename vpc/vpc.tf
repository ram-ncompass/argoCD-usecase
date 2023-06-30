resource "aws_vpc" "source_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "ram-vpc-eks"
  }
}