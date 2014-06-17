class Escalation < Model

  service :escalations

  resource :AllEscalations

  attribute :current_status
  attribute :current_step
  attribute :current_escalation_state

  relation :escalation_definition, EscalationDefinition

  collection :messages,             Message
  collection :notification_results, NotificationResult

end
