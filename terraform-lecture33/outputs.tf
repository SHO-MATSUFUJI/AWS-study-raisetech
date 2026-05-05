output "alb_dns" {
  value = module.alb.alb_dns
}

output "rds_endpoint" {
  value = module.storage.rds_endpoint
}

output "instance_public_ip" {
  value = module.compute.instance_public_ip
}