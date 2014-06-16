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

  require_relative 'sysshep/datapoint'

  require_relative 'sysshep/agent/daemon'
  require_relative 'sysshep/agent/log'
  require_relative 'sysshep/agent/pid'

  require_relative 'sysshep/document'
  require_relative 'sysshep/document/xml'
  require_relative 'sysshep/document/xml_node'
  require_relative 'sysshep/document/generic'
  require_relative 'sysshep/document/observation'
  require_relative 'sysshep/document/escalation'

  require_relative 'sysshep/transport'
  require_relative 'sysshep/transport/url'
  require_relative 'sysshep/transport/http'
  require_relative 'sysshep/transport/get'
  require_relative 'sysshep/transport/post'

  require_relative 'sysshep/version'

end

