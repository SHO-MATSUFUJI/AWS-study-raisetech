variable "evaluation_periods" {
  type = number
  description = "Evaluation periods for the EC2 metric"
}

variable "period" {
  type = number
  description = "Period for the EC2 metric"
}

variable "threshold" {
  type = number
  description = "Threshold for the EC2 metric"
}

variable "ec2_instance" {
 type = string
 description = "EC2 instance ID"
}

variable "email" {
  type = string
  description = "Subscription fo the e-mail address"
}

variable "my_waf" {
  type = string
  description = "WAF ARN"
}