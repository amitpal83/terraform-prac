output "ec2_instance_id" {
    value = aws_instance.publicec2module.*.id
  
}

output "ec2_instance_private_id" {
    value = aws_instance.privatec2module.*.id
}