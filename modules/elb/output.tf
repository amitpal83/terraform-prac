output "elb_dns_name" {
  value = aws_lb.test.dns_name
}

output "elb_zone_id" {
  value = aws_lb.test.zone_id
}