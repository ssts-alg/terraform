output "city_vpc_id" {
  value = aws_vpc.abc.id
}

output "city_vpc_owner_id" {
  value = aws_vpc.abc.owner_id
}
output "city_vpc_arn" {
  value = aws_vpc.abc.arn
}


output "public_instance_public_ip" {
  value = aws_instance.public_instance.*.public_ip
}
output "private_instance_private_ip" {
  value = aws_instance.private_instance.*.private_dns
}
