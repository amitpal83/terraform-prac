resource "aws_ebs_volume" "demofunctionEBSVolume" {
  count             = var.env == "dev" ? 2 : 3
  availability_zone = element(var.az, count.index)
  size              = var.ebs_volume_size
  tags = {
    Name = "${aws_vpc.demo_vpc.tags["Name"]}-ebs-volume-${count.index + 1}"
  }
}