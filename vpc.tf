resource "aws_vpc" "demo_vpc" {
  cidr_block           = var.vpccidr
  enable_dns_hostnames = true
  tags = {
    Name = var.vpcname
  }

}

resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "${aws_vpc.demo_vpc.tags["Name"]}-IGW "
  }
}
