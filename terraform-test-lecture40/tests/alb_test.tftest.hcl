##################################################################################
# alb_test.tftest.hcl
###################################################################################

run "verify_alb" {

  command = plan

  assert {
    condition     = module.alb.alb_internal == false
    error_message = "Internal ALB settings did not match expected"
  }

  assert {
    condition     = module.alb.load_balancer_type == "application"
    error_message = "Load balancer type for ALB did not match expected"
  }

  assert {
    condition     = module.alb.tg_port == 8080
    error_message = "ALB port number did not match expected"
  }

  assert {
    condition     = module.alb.tg_protocol == "HTTP"
    error_message = "Protcol for ALB did not match expected"
  }
}
