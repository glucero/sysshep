class MetricFilterTarget < Model

  service :measurements

  resource :AllMetricFilterTargets

  attribute :name
  attribute :target
  attribute :valid_comparisons

end
