module SysShep::Document
  class Observation < Generic

    def json
      {import_request: to_xml, passwd: 'flibbertigibbet'}
    end

    def xml
      XML.new do |xml|
        xml.import do |import|
          import.agentid.text agent

          @datapoints.group_by(&:client).each do |clientname, client_data|
            import.client(name: clientname) do |client|

              client_data.group_by(&:host).each do |hostname, observations|
                client.host(name: hostname, time: Time.now.utc.to_i) do |host|

                  observations.each do |observation|
                    host.ma(dk: observation.path, time: observation.time) do |ma|
                      ma.m { |m| m.cdata observation.value  }
                      ma.s { |s| s.cdata observation.status }
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
