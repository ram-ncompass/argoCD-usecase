resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.source_vpc.id

  tags = {
    Name = "ram pubsub IG"
  }
}

