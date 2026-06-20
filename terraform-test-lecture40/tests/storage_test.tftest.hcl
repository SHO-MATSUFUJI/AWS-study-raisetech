###################################################################################
# storage_test.tftest.hcl
###################################################################################

run "verify_storage" {

  command = plan

  assert {
    condition     = module.storage.rds_engine == "mysql"
    error_message = "RDS engine did not match expected"
  }

  assert{
    condition = module.storage.engine_version == "8.0.44" 
    error_message = "RDS engine version did not match expected"
  }

  assert{
    condition = module.storage.instance_class == "db.t3.micro" 
    error_message = "RDS instance class did not match expected"
  }

  assert{
    condition = module.storage.skip_final_snapshot == true
    error_message = "RDS skip final snapshot did not match expected"
  }

  assert{
    condition = module.storage.backup_retention_period == 0 
    error_message = "RDS backup retention period number did not match expected"
  }

  assert{
    condition = module.storage.delete_automated_backups == true 
    error_message = "RDS delete automated backups did not match expected"
  }
  
}