#####################################
# Outputs-ID
#####################################

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

#########################################
#Outputs-cidr_block
#########################################

output "VPC_cidr" {
  value = aws_vpc.main.cidr_block
  description = "Cidr block for VPC"
}

output "publicsubnet1a_cidr" {
value = aws_subnet.public_1a.cidr_block
description = "Cidr block for publicsubnet1a"
}

output "publicsubnet1c_cidr" {
value = aws_subnet.public_1c.cidr_block
description = "Cidr block for publicsubnet1c"
}

output "privatesubnet1a_cidr" {
value = aws_subnet.private_1a.cidr_block
description = "Cidr block for privatesubnet1a"
}

output "privatesubnet1c_cidr" {
value = aws_subnet.private_1c.cidr_block
description = "Cidr block for privatesubnet1c"
}
