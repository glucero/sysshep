module SysShep::Agent
  module Log

    FILE = File.join('/var/log/sysshep.log').freeze

    class Formatter < Logger::Formatter

      FORMAT = "[%s #%d] %s - %s\n"

      def call(severity, time, program, message)
        FORMAT % [time.utc.iso8601, Process.pid, severity, message]
      end
    end

    def log
      @log ||= begin
        Logger.new(FILE).tap do |log|
          log.level = Logger::DEBUG
          log.formatter = Formatter.new
        end
      end
    end

    %i(info debug error).each do |level|
      define_method(level) do |*messages|
        log.send level, messages.join(?\n)
      end
    end
  end
end
