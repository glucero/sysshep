class Observation < Model

  service :measurements

  attribute :value
  attribute :status
  attribute :timestamp

  relation :metric, Metric
  relation :host,   Host
  relation :agent,  Agent

end
