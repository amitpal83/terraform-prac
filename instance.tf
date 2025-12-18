# resource "aws_instance" "dev_instance" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   subnet_id     = aws_subnet.dev_subnet3.id

#   key_name      = "demo-key"
#   vpc_security_group_ids = [aws_security_group.dev_sg.id]


#     tags = {
#         Name = "DevInstance"
#     }
# }


resource "aws_instance" "demofunctionInstances" {


  count                  = var.env == "dev" ? 2 : 3
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = element(aws_subnet.demofunctionPublicSubnet.*.id, count.index)
  availability_zone     = element(var.az, count.index)
  key_name               = "demo-key"
  vpc_security_group_ids = [aws_security_group.websecuritygroup.id]

  tags = {
    Name = "${aws_vpc.demo_vpc.tags["Name"]}-instance-${count.index + 1}"
  }

}