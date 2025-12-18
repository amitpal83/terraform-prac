resource "aws_volume_attachment" "demofunctionEBSAttachment" {
  count       = var.env == "dev" ? 2 : 3
  device_name = "/dev/xvdh"
  instance_id = element(aws_instance.demofunctionInstances.*.id, count.index)
  volume_id   = element(aws_ebs_volume.demofunctionEBSVolume.*.id, count.index)
}