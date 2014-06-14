class Metric < Model

  service :measurements

  resource :AllMetric

  attribute :name

  relation :host,        Host
  relation :status,      Status
  relation :metric_type, MetricType

  collection :observations,     Observation
  collection :matching_filters, MetricFilter

  def path
    name
  end
end
