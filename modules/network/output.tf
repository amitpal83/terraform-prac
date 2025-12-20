output "vpc_id" {
  value = aws_vpc.demomodulevpc.id
}

output "vpc_name" {
  value = aws_vpc.demomodulevpc.tags["Name"]
}


output "public_subnet_ids" {
  value = aws_subnet.demomodulePublicSubnet.*.id
}


output "private_subnet_ids" {
  value = aws_subnet.demomodulePrivateSubnet.*.id
}

output "private_subnet_id1" {
  value = element(aws_subnet.demomodulePrivateSubnet.*.id, 0)
}

output "public_subnet_id1" {
  value = element(aws_subnet.demomodulePublicSubnet.*.id, 0)
  
}

output "env" {
  value = var.env
}

