class MetricType < Model

  service :measurements

  resource :AllMetricTypes

  attribute :name
  attribute :path
  attribute :stereotype

  collection :metrics, Metric

end
