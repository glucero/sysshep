module SysShep::Agent
  class PID

    FILE = '/var/run/sysshep.pid'.freeze

    def exist?
      File.exist? FILE
    end

    def read
      File.read FILE
    end

    def delete
      File.delete FILE
    end

    def write
      File.write FILE, Process.pid
    end

    def to_i
      read.to_i
    end
  end
end
