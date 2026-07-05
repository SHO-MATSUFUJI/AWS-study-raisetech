###################################################################################
# compute_test.tftest.hcl
###################################################################################

run "verify_port_number" {

  command = plan

  assert {
    condition     = module.compute.ssh_from_port == 22
    error_message = "SHH from port number did not match expected"
  }

  assert {
    condition     = module.compute.ssh_to_port == 22
    error_message = "SHH To port number did not match expected"
  }
 assert {
    condition     = alltrue([for instance in module.compute.instance_type : instance == "t3.micro"])
    error_message = "EC2 instance type did not match expected"
  }
  
assert {
    condition     = alltrue([for ami in module.compute.instance_ami : ami == data.aws_ssm_parameter.latest_ami.value])
    error_message = "EC2 AMI did not match expected"
  }

}

