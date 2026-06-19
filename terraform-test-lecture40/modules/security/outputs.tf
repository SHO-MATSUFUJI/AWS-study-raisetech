output "web_acl_arn" {
  value = aws_wafv2_web_acl.my_waf.arn
  description = "AWS waf ARN"
}

output "waf_scope" {
  value = aws_wafv2_web_acl.my_waf.scope
  description = "Scope settings for AWS waf"
}

output "waf_name" {
  value = aws_wafv2_web_acl.my_waf.name
  description = "AWS waf name"
}