variable "ec2_ami" {
  type        = string
  description = "The ami for C2"
}

variable "ec2_keypair" {
  type        = string
  description = "The keypair for the EC2"
}

variable "my_pcip" {
  type        = string
  description = "IP address for my PC,CIDR(/32)"
}

variable "db_password" {
  type        = string
  description = "RDS database password"
}

variable "period" {
  type = number
  description = "Period for the EC2 metric"
}

variable "evaluation_periods" {
  type = number
  description = "Evaluation periods for the EC2 metric"
}

variable "threshold" {
  type = number
   description = "Threshold for the EC2 metric"
}

variable "email" {
  type = string
  description = "Subscription fo the e-mail address"
}
