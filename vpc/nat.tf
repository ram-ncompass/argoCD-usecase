resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.pubsub1.id

  tags = {
    Name = "ram-nat-gateway"
  }
}