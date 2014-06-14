module SysShep::Document
  class XMLNode < REXML::Element

    def cdata(value)
      self << REXML::CData.new(value.to_s)
    end

    def text(value)
      self << REXML::Text.new(value.to_s)
    end

    def method_missing(name, attributes = {})
      element = XMLNode.new(name.to_s)

      attributes.each do |key, value|
        element.attributes << REXML::Attribute.new(key.to_s, value)
      end

      self << element
      yield element if block_given?
    end
  end
end
