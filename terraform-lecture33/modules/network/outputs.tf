output "vpc_id" {
  value = aws_vpc.main.id
  description = "VPC ID"
}

output "publicsubnet1a_id" {
  value =  aws_subnet.public_1a.id
  description = "Public subnet 1a ID"
}

output "publicsubnet1c_id" {
  value =  aws_subnet.public_1c.id
  description = "Public subnet 1c ID"
}

output "privatesubnet1a_id" {
  value =  aws_subnet.private_1a.id
  description = "Private subnet 1a ID"
}

output "privatesubnet1c_id" {
  value =  aws_subnet.private_1c.id
  description = "Private subnet 1c ID"
}