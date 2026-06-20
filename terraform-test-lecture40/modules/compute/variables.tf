variable "my_pcip" {
  type = string
  description = "IP address for my PC,CIDR(/32)"
}

variable "vpc_id" {
 type = string
 description = "The VPC ID" 
}
variable "ec2_ami" {
  type = string
  description = "The ami for EC2"
}

variable "ec2_instance" {
  type = string
  default = "t3.micro"
  description = "The instancetype for EC2"
}

variable "ec2_keypair" {
  type = string
  description = "The keypair for EC2"
}

variable "ec2_subnet" {
  type = string
  description = "The subnet ID for EC2"
}