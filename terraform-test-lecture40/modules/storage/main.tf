resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0.44"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = var.db_password
  skip_final_snapshot  = true
  backup_retention_period = 0
  delete_automated_backups = true
  db_subnet_group_name =  aws_db_subnet_group.rds.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  multi_az = false
  publicly_accessible = false
}


resource "aws_db_subnet_group" "rds" {
  name       = "main"
  subnet_ids = [var.private_1a, var.private_1c ]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "RDSSecurityGroup"
  description = "Security Group for RDS"
  vpc_id      = var.vpc_id

  tags = {
    Name = "RDSSecurityGroup"
  }
}

resource "aws_vpc_security_group_ingress_rule" "rds" {
  security_group_id = aws_security_group.rds_sg.id
  referenced_security_group_id =var.ec2_sg
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}