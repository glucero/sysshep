class Host < Model

  service :measurements

  resource :AllHosts

  attribute :name
  attribute :active?
  attribute :tags
  attribute :updated_at
  attribute :created_at

  relation   :client,       Client
  collection :metrics,      Metric
  collection :statuses,     Status
  collection :observations, Observation

end

