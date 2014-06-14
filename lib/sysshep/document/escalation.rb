module SysShep::Document
  class Escalation < Generic

    def json
     {alert: to_xml}
    end

    def xml
      XML.new do |xml|
        xml.alerts do |alerts|

          @datapoints.group_by(&:client).each do |_, client_data|
            client_data.group_by(&:host).each do |_, escalations|

              escalations.each do |escalation|
                alerts.alert do |alert|
                  alert.d_key_path { |d| d.cdata escalation.path    }
                  alert.client     { |c| c.cdata escalation.client  }
                  alert.hostname   { |h| h.cdata escalation.host    }
                  alert.status     { |s| s.cdata escalation.status  }
                  alert.alertmsg   { |m| m.cdata escalation.message }
                  alert.alert_time { |t| t.cdata escalation.time    }

                  alert.alert_request_id do |alert_request_id|
                    alert_request_id.cdata [escalation.client,
                                            escalation.host,
                                            escalation.path,
                                            escalation.time].join(?:)
                  end

                  alert.metric   { |m| m.cdata escalation.value }
                  alert.interval { |i| i.cdata Configuration.interval }
                end
              end
            end
          end
        end
      end
    end
  end
end
