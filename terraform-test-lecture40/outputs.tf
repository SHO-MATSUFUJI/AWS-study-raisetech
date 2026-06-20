output "alb_dns" {
  value       = module.alb.alb_dns
  description = "DNS for the ALB"
}

output "rds_endpoint" {
  value       = module.storage.rds_endpoint
  description = "Address for the RDS endpoint"
}

output "instance_public_ip" {
  value       = module.compute.instance_public_ip
  description = "Public ID for the EC2 instance"
}
