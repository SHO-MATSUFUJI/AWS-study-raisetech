variable "ec2_ami" {
  type        = string
  description = "The ami for C2"
}

variable "ec2_kyepair" {
  type        = string
  description = "The kyepair for the EC2"
}

variable "my_pcip" {
  type        = string
  description = "IP adress for my PC"
}

variable "db_password" {
  type        = string
  description = "RDS database password"
}

variable "period" {
  type = number
}

variable "evaluation_periods" {
  type = number
}

variable "threshold" {
  type = number
}

variable "email" {
  type = string
}
