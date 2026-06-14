output "alb_arn" {
  value = aws_lb.alb.arn
  description = "ARN for the ALB"
}

output "alb_dns" {
  value = aws_lb.alb.dns_name
  description = "DNS for the ALB"
}


output "alb_sg" {
  value = aws_security_group.alb_sg.id
  description = "Security group for the ALB"
}