module SysShep

  require 'optparse'

  require 'net/http'
  require 'cgi'
  require 'uri'
  require 'openssl'
  require 'socket'
  require 'open3'

  require 'etc'

  require 'forwardable'
  require 'monitor'
  require 'singleton'

  require 'time'
  require 'set'

  require 'readline'
  require 'shellwords'
  require 'fileutils'
  require 'stringio'

  require 'logger'
  require 'tmpdir'

  require 'yaml'
  require 'json'
  require 'rexml/document'

  require_relative 'sysshep/agent/daemon'
  require_relative 'sysshep/agent/log'
  require_relative 'sysshep/agent/pid'

  require_relative 'sysshep/transport'
  require_relative 'sysshep/transport/url'
  require_relative 'sysshep/transport/http'
  require_relative 'sysshep/transport/get'
  require_relative 'sysshep/transport/post'

  require_relative 'sysshep/model'

  require_relative 'sysshep/core/account'
  require_relative 'sysshep/core/address'
  require_relative 'sysshep/core/agent'
  require_relative 'sysshep/core/client'
  require_relative 'sysshep/core/datapoint'
  require_relative 'sysshep/core/host'
  require_relative 'sysshep/core/metric'
  require_relative 'sysshep/core/metric_description'
  require_relative 'sysshep/core/metric_filter'
  require_relative 'sysshep/core/metric_filter_target'
  require_relative 'sysshep/core/metric_type'
  require_relative 'sysshep/core/observation'
  require_relative 'sysshep/core/privilege'
  require_relative 'sysshep/core/privilege_for_role'
  require_relative 'sysshep/core/role'
  require_relative 'sysshep/core/role_assignment'
  require_relative 'sysshep/core/status'

  require_relative 'sysshep/alarm/escalation'
  require_relative 'sysshep/alarm/escalation_definition'
  require_relative 'sysshep/alarm/escalation_state'
  require_relative 'sysshep/alarm/message'
  require_relative 'sysshep/alarm/notification_result'

  require_relative 'sysshep/document'
  require_relative 'sysshep/document/xml'
  require_relative 'sysshep/document/xml_node'
  require_relative 'sysshep/document/generic'
  require_relative 'sysshep/document/observation'
  require_relative 'sysshep/document/escalation'

  require_relative 'sysshep/version'

end

