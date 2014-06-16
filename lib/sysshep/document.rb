module SysShep::Document

  class InvalidDocument < StandardError; end

  module ValidDatapoint

    Text   = -> text { String === test && text =~ /[^[:space:]]/ }
    Path   = -> path { Text === path && path =~ /^[^|].*\|.*[^|]$/ && path.length < 150 }
    Metric = -> metric { Float === metric && !metric.nan? }
    Status = -> status { Integer === status && (0..2) === status }
    Epoch  = -> epoch { Integer === epoch  && epoch > 0 }

    def self.===(datapoint)
      Datapoint === datapoint &&
      (datapoint.alerting? ? Text === datapoint.message : true) &&
      Text   === datapoint.client &&
      Text   === datapoint.host   &&
      Path   === datapoint.path   &&
      Metric === datapoint.value  &&
      Status === datapoint.status &&
      Epoch  === datapoint.time
    end
  end

  module ValidObservation

    def self.===(document)
      Observation === document &&
      document.any? &&
      document.all?&ValidDatapoint.method(:===)
    end
  end

  module ValidEscalation

    def self.===(document)
      Escalation === document &&
      document.any? &&
      document.all?&ValidDatapoint.method(:===) &&
      document.all?(&:alarming?)
    end
  end
end
