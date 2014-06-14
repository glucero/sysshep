module SysShep::Transport
  module URL
    class << self
      def split(uri)
        scheme, userinfo, host, port, registry, path, opaque, query, fragment = URI.split(uri)

        # if we get a url without a scheme, URI#parse will do the wrong thing
        if scheme.nil? && host.nil?
          split SCHEME + '://' << uri
        else
          # force https for now
          [SCHEME, userinfo, host, PORT, registry, path, opaque, query, fragment]
        end
      end

      def parse(uri)
        URI::HTTPS.new *split(uri), URI
      end
    end
  end
end
