resource "aws_cloudwatch_metric_alarm" "my_cloudwatch" {
  alarm_name                = "MyCloudWatch"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = var.period
  statistic                 = "Average"
  threshold                 = var.threshold
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = [aws_sns_topic.my_sns.arn]
  dimensions = {
   InstanceId = var.ec2_instance
  }
  alarm_actions =  [aws_sns_topic.my_sns.arn]
}

resource "aws_sns_topic" "my_sns" {
  name = "watch-study-alarm-topic"
}

resource "aws_sns_topic_subscription" "my_sns_subscription" {
  topic_arn = aws_sns_topic.my_sns.arn
  protocol  = "email"
  endpoint  = var.email
}

resource "aws_cloudwatch_log_group" "logs" {
  name = "aws-waf-logs-awsstudy"
}

resource "aws_wafv2_web_acl_logging_configuration" "logging_configuration" {
  log_destination_configs = [aws_cloudwatch_log_group.logs.arn]
  resource_arn            = var.my_waf
}