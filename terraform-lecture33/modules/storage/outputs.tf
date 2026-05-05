output "rds_endpoint" {
  value = aws_db_instance.rds.address
  description = "Address for the RDS endpoint"
}