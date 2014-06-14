class PrivilegeForRole < Model

  service :kernel

  relation :privilege, Privilege

end
