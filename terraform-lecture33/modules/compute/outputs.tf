output "ec2_sg" {
 value =  aws_security_group.ec2.id
}

output "ec2_instance" {
  value = aws_instance.ec2.id
}

output "instance_public_ip" {
  value = aws_instance.ec2.public_ip
}