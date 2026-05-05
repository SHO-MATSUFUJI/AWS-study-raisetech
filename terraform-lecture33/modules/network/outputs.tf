output "vpc_id" {
  value = aws_vpc.main.id
}

output "publicsubnet1a_id" {
  value =  aws_subnet.public_1a.id
}

output "publicsubnet1c_id" {
  value =  aws_subnet.public_1c.id
}

output "privatesubnet1a_id" {
  value =  aws_subnet.private_1a.id
}

output "privatesubnet1c_id" {
  value =  aws_subnet.private_1c.id
}