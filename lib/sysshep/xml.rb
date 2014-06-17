module SysShep
  class XML

    VERSION  = '1.0'.freeze
    ENCODING = 'UTF-8'.freeze

    class << self
      def dump(xml)
        xml.nodes.map(&:to_s).join
      end

      def pretty_format(xml)
        formatter = REXML::Formatters::Pretty.new(2)
        formatter.compact = true
        xml.nodes.map do |node|
          formatter.write node, StringIO.new
        end.map(&:string).join ?\n
      end
    end

    attr_reader :nodes

    def initialize
      @nodes = REXML::Document.new
      @nodes << REXML::XMLDecl.new(VERSION, ENCODING)

      yield self if block_given?
    end

    def method_missing(name)
      element = Node.new(name.to_s)
      @nodes << element
      yield element if block_given?
    end
  end
end
