resource "aws_subnet" "pubsub1" {
  vpc_id     = aws_vpc.source_vpc.id
  cidr_block = var.pubsub1_cidr_block
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "ram-pubsub1"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/ram-cluster" = "owned"
  }
}

resource "aws_subnet" "pubsub2" {
  vpc_id     = aws_vpc.source_vpc.id
  cidr_block = var.pubsub2_cidr_block
  availability_zone = "us-east-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "ram-pubsub2"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/ram-cluster" = "owned"
  }
}

# PRIVATE SUBNET    

resource "aws_subnet" "privsub1" {
  vpc_id     = aws_vpc.source_vpc.id
  cidr_block = var.privsub1_cidr_block
  availability_zone = "us-east-2a"

  tags = {
    Name = "ram-privsub1"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/ram-cluster" = "owned"
  }
}

resource "aws_subnet" "privsub2" {
  vpc_id     = aws_vpc.source_vpc.id
  cidr_block = var.privsub2_cidr_block
  availability_zone = "us-east-2c"

  tags = {
    Name = "ram-privsub2"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/ram-cluster" = "owned"
  }
}
