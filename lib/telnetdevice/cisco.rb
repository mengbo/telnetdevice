require "telnetdevice/base"
require "telnetdevice/ciscolike"

module TelnetDevice
  class CISCO < Base
    include CISCOLike

    def initialize(host, password, enable_password = password)
      super(:host => host, :dump_log => "#{host}.log")
      login(password)
      cmd("terminal length 0")
      enable(enable_password)
    end

    def exit
      cmd("terminal no length")
      close
    end

  end

end
