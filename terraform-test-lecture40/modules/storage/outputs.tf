output "rds_endpoint" {
  value = aws_db_instance.rds.address
  description = "Address for the RDS endpoint"
}

output "rds_engine" {
  value = aws_db_instance.rds.engine
  description = "RDS engine"
}

output "engine_version" {
  value = aws_db_instance.rds.engine_version
  description = "RDS engine version"
}

output "instance_class" {
  value = aws_db_instance.rds.instance_class
  description = "Instance class for RDS"
}

output "skip_final_snapshot" {
  value = aws_db_instance.rds.skip_final_snapshot
  description = "Skip final snapshot for RDS"
}

output "backup_retention_period" {
  value = aws_db_instance.rds.backup_retention_period
  description = "Backup retention period for RDS"
}

output "delete_automated_backups" {
  value = aws_db_instance.rds.delete_automated_backups
  description = "Delete automated backups for RDS"
}