class Role < Model

  service :kernel

  resource :AllRoles

  attribute :name
  attribute :slug

  collection :privileges_for_role, PrivilegeForRole

end
