class Status < Model

  service :measurements

  attribute :status
  attribute :value
  attribute :last_updated

  relation :metric, Metric

end
