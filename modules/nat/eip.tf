resource "aws_eip" "nat_eip" {
  count= var.env=="prod" ? 1 : 0
  tags = {
    Name = "${var.env}-nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  count         = var.env=="prod" ? 1 : 0
  allocation_id = aws_eip.nat_eip.0.id
  subnet_id     = var.public_subnet_1
  tags = {
    Name = "${var.vpc_name}-nat-gw"
  }
}