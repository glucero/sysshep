class Account < Model

  service :kernel

  resource :AllAccounts

  attribute :login
  attribute :full_name
  attribute :timezone
  attribute :password
  attribute :updated_at
  attribute :created_at

  relation :preferred_client, Client
  relation :initial_client,   Client
  relation :initial_role,     Role

  collection :roles_by_client,      Role
  collection :clients_by_role,      Client
  collection :clients_by_privilege, Client
  collection :addresses,            Address
  collection :visible_addresses,    Address
  collection :role_assignments,     Role

end

