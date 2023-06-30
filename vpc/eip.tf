resource "aws_eip" "eip" {
  vpc                = true
  tags = {
    Name = "ram-ecs-eip"
  }
}