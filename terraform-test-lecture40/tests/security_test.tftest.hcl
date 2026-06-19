#################################################################################
# security_test.tftest.hcl
###################################################################################

run "verify_security" {

  command = plan

  assert {
    condition     = module.security.waf_scope == "REGIONAL"
    error_message = "WAF scope did not match expected"
  }

  assert {
    condition     = module.security.waf_name == "mywaf"
    error_message = "Aws waf name did not match the expected value"
  }
}