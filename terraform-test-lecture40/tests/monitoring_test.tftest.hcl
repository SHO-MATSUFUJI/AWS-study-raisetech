##################################################################################
# monitoring_test.tftest.hcl
###################################################################################

run "verify_monitoring" {

  command = plan

  assert {
    condition     = module.monitoring.alarm_name == "MyCloudWatch"
    error_message = "Alarm name did not match expected"
  }

  assert {
    condition     = module.monitoring.comparison_operator == "GreaterThanThreshold"
    error_message = "Comparison operator did not match expected"
  }

  assert {
    condition     = module.monitoring.evaluation_periods == 1
    error_message = "Evaluation periods number did not match expected"
  }

assert {
    condition     = module.monitoring.metric_name == "CPUUtilization"
    error_message = "Metric name did not match expected"
  }

assert {
    condition     = module.monitoring.name_space == "AWS/EC2"
    error_message = "Name space did not match expected"
  }
}