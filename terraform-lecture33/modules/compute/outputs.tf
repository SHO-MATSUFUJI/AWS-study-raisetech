output "ec2_sg" {
  value =  aws_security_group.ec2.id
  description = "Security group for the EC2"
}

output "ec2_instance" {
  value = aws_instance.ec2.id
  description = "EC2 instance ID"
}

output "instance_public_ip" {
  value = aws_instance.ec2.public_ip
  description = "Public ID for the EC2 instance"
}