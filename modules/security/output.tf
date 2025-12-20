output "sg_id" {
  value = aws_security_group.demomodulesg.id
}

output "sg_name" {
  value = aws_security_group.demomodulesg.tags["Name"]
}