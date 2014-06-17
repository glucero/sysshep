module SysShep::Transport

  SCHEME = 'https'.freeze
  PORT   = 443

  NotAuthorized = Class.new(StandardError)
  RequestFailed = Class.new(StandardError)

  MIME = Hash.new(  'application/json'.freeze ).merge(
    kernel:         'application/vnd.absperf.sskj1+json'.freeze,
    measurements:   'application/vnd.absperf.ssmj1+json'.freeze,
    escalations:    'application/vnd.absperf.ssaj1+json'.freeze,
    configurations: 'application/vnd.absperf.sscj1+json'.freeze
  )

  ServiceMain = -> fqdn { "https://core.#{fqdn}/service_descriptors" }

end

