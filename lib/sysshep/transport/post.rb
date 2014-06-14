module SysShep
  module Transport
    class Post < Document::JSON
      class Request < Net::HTTP::Post
        def initialize(path, document, mime)
          super path

          basic_auth Configuration.username, Configuration.password
          self['Accept']       = MIME[mime]
          self['Content-Type'] = MIME[mime]
          self['User-Agent']   = "SysShep (#{VERSION})"

          @body = document
        end
      end

      def initialize(url, document, mime)
        url = URL.parse(url)

        HTTP.new(url.host, url.port) do |http|
          http.request Request.new(url.path, document, mime)
        end
      end
    end
  end
end
