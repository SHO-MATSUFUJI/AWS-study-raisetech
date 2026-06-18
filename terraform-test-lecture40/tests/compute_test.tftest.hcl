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
    condition     = module.compute.ec2_from_port == 8080
    error_message = "EC2_from_port number did not match expected"
  }

assert {
    condition     = module.compute.ec2_to_port == 8080
    error_message = "EC2_to_port number did not match expected"
  }  

 assert {
    condition     = module.compute.instance_type== "t3.micro"
    error_message = "EC2 instance type did not match expected"
  }
  
assert {
    condition     = module.compute.instance_ami== data.aws_ssm_parameter.latest_ami.value
    error_message = "EC2 AMI did not match expected"
  }

}

