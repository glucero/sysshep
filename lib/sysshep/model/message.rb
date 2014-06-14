class Message < Model

  service :escalations

  attribute :alert_count
  attribute :message
  attribute :status
  attribute :min_metric_value
  attribute :max_metric_value
  attribute :first_seen_at
  attribute :last_seen_at

  relation :escalation, Escalation
  relation :metric,     Metric

end
