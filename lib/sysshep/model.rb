module Model

  extend Forwardable

  def_delegators :@json, :[], :[]=

  def initialize(json)
    @json = json
  end

  class << self
    def service(service)
      @service = service
    end

    def resource(resource)
      @resource = resource
    end

    def attribute(attribute)
      class_eval <<-CODE
        def #{attribute}
          self['#{attribute}']
        end

        def #{attribute}=(value)
          self['#{attribute}'] = value
        end
      CODE
    end

    def relation(attribute, model)
      class_eval <<-CODE
        def #{attribute}=(value)
          @#{attribute} = value
        end

        def #{attribute}
          @#{attribute} ||= #{model}.new cache[ self['#{attribute}_href'] ]
        end
      CODE
    end

    def collection(attribute, model)
      class_eval <<-CODE
        def #{attribute}=(value)
          @#{attribute} = value
        end

        def #{attribute}
          @#{attribute} ||= cache[ self['#{attribute}_href'] ]['items'].map &#{model}.method(:new)
        end
      CODE
    end
  end
end
