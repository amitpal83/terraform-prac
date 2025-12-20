resource "aws_vpc" "demomodulevpc" {
  cidr_block           = var.vpccidr
  enable_dns_hostnames = true
  tags = {
    Name = var.vpcname
  }
}  


resource "aws_internet_gateway" "demomoduleigw" {
  vpc_id = aws_vpc.demomodulevpc.id
  tags = {
    Name = "${aws_vpc.demomodulevpc.tags["Name"]}-IGW "
  }
}