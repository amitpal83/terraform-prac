resource "aws_route_table" "demomodulePublicRouteTable" {
  vpc_id = aws_vpc.demomodulevpc.id
  tags = {
    Name = "${aws_vpc.demomodulevpc.tags["Name"]}-public-rt"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demomoduleigw.id
  }
}


resource "aws_route_table" "demomodulePrivateRouteTable" {
  vpc_id = aws_vpc.demomodulevpc.id
  tags = {
    Name = "${aws_vpc.demomodulevpc.tags["Name"]}-private-rt"
  }
}


resource "aws_route_table_association" "demomodulePublicRouteTableAssociation" {
  count          = length(aws_subnet.demomodulePublicSubnet)
  subnet_id      = element(aws_subnet.demomodulePublicSubnet.*.id, count.index)
  route_table_id = aws_route_table.demomodulePublicRouteTable.id
}

resource "aws_route_table_association" "demomodulePrivateRouteTableAssociation" {
  count          = length(aws_subnet.demomodulePrivateSubnet)
  subnet_id      = element(aws_subnet.demomodulePrivateSubnet.*.id, count.index)
  route_table_id = aws_route_table.demomodulePrivateRouteTable.id
}