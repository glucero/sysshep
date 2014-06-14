class MetricDescription < Model

  service :measurements

  resource :AllMetricDescriptions

  attribute :metric_type_pattern
  attribute :description

end
