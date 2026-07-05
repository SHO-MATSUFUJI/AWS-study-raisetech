resource "aws_security_group" "ec2" {
  name        = "EC2SecurityGroup"
  description = "Security Group for EC2 instance"
  vpc_id      = var.vpc_id
  tags = {
    Name = "EC2SecurityGroup"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ec2_ssh" {
  security_group_id = aws_security_group.ec2.id

  cidr_ipv4   = var.my_pcip
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22

}
resource "aws_instance" "ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance
  subnet_id = var.ec2_subnet
  vpc_security_group_ids =  [ aws_security_group.ec2.id]
  key_name = var.ec2_keypair
  count = 2
  tags = {
    Name = "MyEC2Instance-${count.index + 1}"
  }
}
