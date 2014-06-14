module SysShep
  module Transport
    class Get < Document::JSON
      class Request < Net::HTTP::Get
        def initialize(path, mime)
          super path

          basic_auth Configuration.username, Configuration.password
          self['Accept']       = MIME[mime]
          self['Content-Type'] = MIME[mime]
          self['User-Agent']   = "SysShep (#{VERSION})"
        end
      end

      def initialize(url, mime)
        url = URL.parse(url)

        HTTP.new(url.host, url.port) do |http|
          request = Request.new(url.path, mime)

          @data = parse(http.validated_request request)
        end
      end
    end
  end
end

