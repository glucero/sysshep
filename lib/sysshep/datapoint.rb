class SysShep::Datapoint

  attr_accessor :client,
                :host,

                :path,
                :value,
                :status,
                :time

  attr_writer :message
  def message; @message || "Metric returned status #{status}" end

  def alerting?
    !!status && status.nonzero?
  end
  alias alarming? alerting?

  def initialize(line = nil)
    if line
      path, value, status, message = line.split(?\t)

      @path    = path
      @value   = Float(value)
      @status  = Integer(status || 0)
      @message = message if message
      @time    = Time.now.to_i
    end

    yield self if block_given?
  end
end

