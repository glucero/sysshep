class MetricFilter < Model

  service :measurements

  resource :AllMetricFilters

  attribute :purpose
  attribute :any_or_all
  attribute :criteria

  relation :host,   Host
  relation :client, Client

  collection :metrics,         Metric
  collection :ignored_metrics, IgnoredMetric

end
