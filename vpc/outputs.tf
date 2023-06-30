output "subnets_id" {
  value = [aws_subnet.pubsub1.id, aws_subnet.pubsub2.id, aws_subnet.privsub1.id, aws_subnet.privsub2.id]
}

output "vpc_id" {
  value = aws_vpc.source_vpc.id
}