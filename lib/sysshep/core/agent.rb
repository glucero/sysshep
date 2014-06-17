class Agent < Model

  service :measurements

  resource :AllAgents

  attribute :configuration_href

  relation :account, Account
  relation :client,  Client
  relation :host,    Host

end
