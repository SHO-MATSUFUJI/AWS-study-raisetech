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

output "ssh_from_port" {
  value = aws_vpc_security_group_ingress_rule.ec2_ssh.from_port
  description = "From port number from ssh"
}

output "ssh_to_port" {
  value = aws_vpc_security_group_ingress_rule.ec2_ssh.to_port
  description = "To port number from ssh"
}

output "ec2_to_port" {
  value = aws_vpc_security_group_ingress_rule.ec2_8080.to_port
  description = "To port number from EC2 port"
}

output "ec2_from_port" {
  value = aws_vpc_security_group_ingress_rule.ec2_8080.from_port
  description = "From port number from EC2 port"
}

output "instance_type" {
  value = aws_instance.ec2.instance_type
  description = "EC2 instance type"
}

output "instance_ami" {
  value = aws_instance.ec2.ami
  description = "The ami for EC2"
}