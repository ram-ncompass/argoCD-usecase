resource "aws_route_table" "pubsub1_route" {
  vpc_id = aws_vpc.source_vpc.id
  tags = {
    Name = "ram-pubsub1-route"
  }
}

resource "aws_route" "internet_gateway_route1" {
  route_table_id = aws_route_table.pubsub1_route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "pubsub1_route_association" {
  subnet_id = aws_subnet.pubsub1.id
  route_table_id = aws_route_table.pubsub1_route.id
}

############################################################

resource "aws_route_table" "pubsub2_route" {
  vpc_id = aws_vpc.source_vpc.id
  tags = {
    Name = "ram-pubsub2-route"
  }
}

resource "aws_route" "internet_gateway_route2" {
  route_table_id = aws_route_table.pubsub2_route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "pubsub2_route_association" {
  subnet_id = aws_subnet.pubsub2.id
  route_table_id = aws_route_table.pubsub2_route.id
}

############################################################

resource "aws_route_table" "privsub1_route" {
  vpc_id = aws_vpc.source_vpc.id
  tags = {
    Name = "ram-privsub1-route"
  }
}

resource "aws_route" "nat_gateway_route1" {
  route_table_id            = aws_route_table.privsub1_route.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.nat_gateway.id
}

resource "aws_route_table_association" "privsub1_route_association" {
  subnet_id = aws_subnet.privsub1.id
  route_table_id = aws_route_table.privsub1_route.id
}

############################################################

resource "aws_route_table" "privsub2_route" {
  vpc_id = aws_vpc.source_vpc.id
  tags = {
    Name = "ram-privsub2-route"
  }
}

resource "aws_route" "nat_gateway_route2" {
  route_table_id            = aws_route_table.privsub2_route.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.nat_gateway.id
}

resource "aws_route_table_association" "privsub2_route_association" {
  subnet_id = aws_subnet.privsub2.id
  route_table_id = aws_route_table.privsub2_route.id
}