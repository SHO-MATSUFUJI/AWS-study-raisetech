variable "db_password" {
  type = string
  description = "RDS database password"
}

variable "private_1a" {
  type = string
  description = "PrivateSubnet 1a ID"
}

variable "private_1c" {
  type = string
  description = "PrivateSubnet 1c ID"
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "ec2_sg" {
  type = string
  description = "Security group for the EC2"
}