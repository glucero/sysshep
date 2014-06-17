class Client < Model

  service :kernel

  resource :AllClients

  attribute :name
  attribute :longname
  attribute :active

  relation :parent, Client

  collection :hosts, Host

  def active?
    active
  end
end
