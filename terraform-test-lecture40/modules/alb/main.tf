resource "aws_lb" "alb" {
  name               = "MyALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [
    aws_security_group.alb_sg.id
  ]
  subnets            =[
    var.public_1a,var.public_1c
  ]

}

resource "aws_lb_target_group" "tg" {
  name     = "MyTargetGroup"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path = "/"
  }
}

resource "aws_lb_target_group_attachment" "alb" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.ec2_instance
  port             = 8080
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_security_group" "alb_sg" {
  name        = "ALBSecurityGroup"
  description = "Security Group for alb"
  vpc_id      = var.vpc_id

  tags = {
    Name = "ALBSecurityGroup"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}