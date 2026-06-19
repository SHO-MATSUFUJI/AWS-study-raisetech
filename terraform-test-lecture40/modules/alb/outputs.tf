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

output "alb_internal" {
  value = aws_lb.alb.internal
  description = "Internal settings for ALB"
}

output "load_balancer_type" {
  value = aws_lb.alb.load_balancer_type
  description = "ALB load balancer type"
}

output "tg_port" {
  value = aws_lb_target_group.tg.port
  description = "Target group port number for ALB"
}

output "tg_protocol" {
  value = aws_lb_target_group.tg.protocol
  description = "Target group protocol for ALB"
}