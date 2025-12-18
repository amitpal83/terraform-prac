resource "aws_route_table" "dev_routing_table" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = var.devroutingtable
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id
  }

}


resource "aws_route_table_association" "dev_subnet3_association" {
  subnet_id      = aws_subnet.dev_subnet3.id
  route_table_id = aws_route_table.dev_routing_table.id

}

resource "aws_route_table_association" "dev_subnet2_association" {
  subnet_id      = aws_subnet.dev_subnet2.id
  route_table_id = aws_route_table.dev_routing_table.id
}

resource "aws_route_table_association" "dev_subnet1_association" {
  subnet_id      = aws_subnet.dev_subnet1.id
  route_table_id = aws_route_table.dev_routing_table.id
}


resource "aws_route_table" "demofunctionPublicRouteTable" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "${aws_vpc.demo_vpc.tags["Name"]}-public-rt"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id
  }
}


resource "aws_route_table_association" "demofunctionPublicRouteTableAssociation" {
  count          = length(aws_subnet.demofunctionPublicSubnet)
  subnet_id      = element(aws_subnet.demofunctionPublicSubnet.*.id, count.index)
  route_table_id = aws_route_table.demofunctionPublicRouteTable.id
}


resource "aws_route_table" "demofunctionPrivateRouteTable" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "${aws_vpc.demo_vpc.tags["Name"]}-private-rt"
  }

}
