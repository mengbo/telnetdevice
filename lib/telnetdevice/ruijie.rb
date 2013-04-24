require "telnetdevice/base"
require "telnetdevice/ciscolike"

module TelnetDevice
  class Ruijie < Base
    include CISCOLike

    def initialize(host, password, enable_password = password)
      super(:host => host, :dump_log => "#{host}.log")
      login(password)
      enable(enable_password)
      cmd("terminal length 0")
    end

    def exit
      cmd("end")
      cmd("terminal no length")
      close
    end

  end

  class Ruijie21 < Ruijie
    def upgrade_ctrl(ctrl_file)
      copy(ctrl_file, "flash:ctrl.bin")
    end

    def upgrade_os(os_file)
      copy(os_file, "flash:s2126g.bin")
    end

    def upgrade_to_18_1a2(ctrl_31_url, ctrl_33_url, s2126g_url)
      v30 = "System hardware version : 3.0"
      v31 = "System hardware version : 3.1"
      version = get_version
      if version.include? v30 or version.include? v31
        upgrade_ctrl(ctrl_31_url)
      else
        upgrade_ctrl(ctrl_33_url)
      end
      upgrade_os(s2126g_url)
      reload
      exit
    end

  end

  class Ruijie57 < Ruijie
    def upgrade_os(os_file)
      copy(os_file, "flash:rgos.bin")
      reload
    end

  end

end
