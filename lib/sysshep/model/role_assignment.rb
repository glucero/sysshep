class RoleAssignment < Model

  service :kernel

  attribute :created_at
  attribute :deactivated_at

  relation :client,  Client
  relation :role,    Role
  relation :account, Account

end
