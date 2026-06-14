variable "vpc_id" {
 type = string
 description = "The VPC ID" 
}

variable "ec2_instance" {
 type = string
 description = "The instance ID for EC2"

}
variable "public_1a" {
  type = string
  description = "The publicsubnet_1a ID"
}

variable "public_1c" {
  type = string
  description = "The publicsubnet_1c ID"
}