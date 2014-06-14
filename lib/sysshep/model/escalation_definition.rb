class EscalationDefinition < Model

  service :escalations

  resource :ActiveEscalationDefinitions

  attribute :active
  attribute :steps_attributes

  relation :client, Client
  relation :filter, MetricFilter

end

