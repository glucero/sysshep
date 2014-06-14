module SysShep::Transport
  class HTTP < Net::HTTP

    def validated_request(http_request)
      request(http_request).tap do |response|
        raise NotAuthorized if Net::HTTPUnauthorized === response
        raise RequestFailed unless Net::HTTPSuccess === response
      end
    end

    def initialize(host, port, &block)
      super host, port

      if port == PORT
        @use_ssl = true
        @verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      start &block
    end
  end
end
