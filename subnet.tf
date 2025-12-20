
resource "aws_subnet" "dev_subnet1" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = var.subnet1_cidr
  tags = {
    Name = var.subnet1_name
  }

}


resource "aws_subnet" "dev_subnet2" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = var.subnet2_cidr
  tags = {
    Name = var.subnet2_name
  }

}



resource "aws_subnet" "dev_subnet3" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = var.subnet3_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet3_name
  }

}



resource "aws_subnet" "demofunctionPublicSubnet" {
  vpc_id                  = aws_vpc.demo_vpc.id
  count                   = length(var.public_subnet_cidr_list)
  cidr_block              = element(var.public_subnet_cidr_list, count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(var.az, count.index)
  tags = {
    Name = "${aws_vpc.demo_vpc.tags["Name"]}-publicsubnet-${count.index + 1}"
  }

}


resource "aws_subnet" "demofunctionPrivateSubnet" {
  vpc_id     = aws_vpc.demo_vpc.id
  count      = length(var.private_subnet_cidr_list)
  cidr_block = element(var.private_subnet_cidr_list, count.index)
  tags = {
    Name = "${aws_vpc.demo_vpc.tags["Name"]}-privatesubnet-${count.index + 1}"
  }

}