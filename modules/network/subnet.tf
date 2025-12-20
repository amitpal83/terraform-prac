resource "aws_subnet" "demomodulePublicSubnet" {
  vpc_id     = aws_vpc.demomodulevpc.id
  count= length(var.public_cidr_list)
  cidr_block = element(var.public_cidr_list, count.index)
  availability_zone = element(var.az, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${aws_vpc.demomodulevpc.tags["Name"]}-PublicSubnet-${count.index + 1}"
  }
}

resource "aws_subnet" "demomodulePrivateSubnet" {
  vpc_id     = aws_vpc.demomodulevpc.id
  count= length(var.private_cidr_list)
  cidr_block = element(var.private_cidr_list, count.index)
  availability_zone = element(var.az, count.index)
  tags = {
    Name = "${aws_vpc.demomodulevpc.tags["Name"]}-PrivateSubnet-${count.index + 1}"
  }
}