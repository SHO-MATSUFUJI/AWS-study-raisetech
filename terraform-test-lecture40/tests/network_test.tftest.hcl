###################################################################################
# network_test.tftest.hcl
###################################################################################

run "verify_vpc_cidr_block" {

  command = plan

  assert {
    condition     = module.network.VPC_cidr == "10.0.0.0/16"
    error_message = "VPC cidr block did not match expected"
  }

assert {
    condition     = module.network.publicsubnet1a_cidr == "10.0.1.0/24"
    error_message = "Subnet pbulic 1a cidr block did not match expected"
  }

assert {
    condition     = module.network.publicsubnet1c_cidr == "10.0.2.0/24"
    error_message = "Subnet pbulic 1c cidr block did not match expected"
  }

assert {
    condition     = module.network.privatesubnet1a_cidr == "10.0.3.0/24"
    error_message = "Subnet private 1a cidr block did not match expected"
  }  

assert {
    condition     = module.network.privatesubnet1c_cidr == "10.0.4.0/24"
    error_message = "Subnet private 1c cidr block did not match expected"
  }  

}