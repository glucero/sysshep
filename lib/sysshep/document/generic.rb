module SysShep::Document
  class Generic

    include Enumerable

    attr_reader :agent

    def initialize(datapoints, options = {})
      @agent = options[:agent]

      @datapoints = datapoints.each do |datapoint|
        datapoint.host   ||= options[:host]
        datapoint.client ||= options[:client]
      end
    end

    def each(&block)
      @datapoints.each &block
    end

    def to_xml
      XML.dump xml
    end

    def to_pretty_xml
      XML.pretty_format xml
    end

    def to_json
      JSON.dump json
    end

    def to_pretty_json
      JSON.pretty_format json
    end
  end
end
