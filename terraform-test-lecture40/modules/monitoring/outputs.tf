# このモジュールは外部へ変数を渡す必要がありません。
# インフラテスト用に出力します。

output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.my_cloudwatch.alarm_name
  description = "Alarm name for cloudwatch"
}

output "comparison_operator" {
  value = aws_cloudwatch_metric_alarm.my_cloudwatch.comparison_operator
  description = "Comparison operator used to evaluate the metric against the threshold"
}

output "evaluation_periods" {
  value = aws_cloudwatch_metric_alarm.my_cloudwatch.evaluation_periods
  description = "Number of evaluation periods"
}

output "metric_name" {
  value = aws_cloudwatch_metric_alarm.my_cloudwatch.metric_name
  description = "Metric name for the CloudWatch alarm"
}

output "name_space" {
  value = aws_cloudwatch_metric_alarm.my_cloudwatch.namespace
  description = "Name space for CloudWatch alarm" 
}
