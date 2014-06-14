class Address < Model

  service :kernel

  resource :AllAddresses

  attribute :identifier
  attribute :community
  attribute :delivery_method
  attribute :active?
  attribute :created_at
  attribute :updated_at
  attribute :deleted_at

  relation :account, Account

end

