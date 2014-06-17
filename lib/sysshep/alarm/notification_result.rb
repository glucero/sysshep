class NotificationResult < Model

  service :escalation

  attribute :notification_at
  attribute :result
  attribute :success
  attribute :created_at

  relation :escalation, Escalation
  relation :address,    Address

end
