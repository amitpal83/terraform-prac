resource "aws_security_group" "dev_sg" {
  name        = var.securitygroupname
  description = "Security group for dev environment"
  vpc_id      = aws_vpc.demo_vpc.id

  tags = {
    Name = var.devsecuritygroup
  }

}

resource "aws_vpc_security_group_ingress_rule" "allow_http_inbound" {

  security_group_id = aws_security_group.dev_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"

}

resource "aws_vpc_security_group_ingress_rule" "allow_https_inbound" {

  security_group_id = aws_security_group.dev_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"

}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_inbound" {

  security_group_id = aws_security_group.dev_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"

}


resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {

  security_group_id = aws_security_group.dev_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "tcp"
}


resource "aws_security_group" "websecuritygroup" {

  description = "Security group for web servers"
  vpc_id      = aws_vpc.demo_vpc.id

  tags = {
    Name = "${aws_vpc.demo_vpc.tags["Name"]}-web-sg"
  }

  dynamic "ingress" {
    for_each = local.ingress_rule1
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}


