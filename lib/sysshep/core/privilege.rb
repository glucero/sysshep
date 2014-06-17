class Privilege < Model

  service :kernel

  resource :AllPrivileges

  attribute :name

  collection :roles_having_privilege, Role

end
