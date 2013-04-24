require "telnetdevice/base"

module TelnetDevice
  module CISCOLike
    def enable(password)
      line = cmd("String" => "enable", "Match" => @password_prompt)
      line += cmd(password)
    end

    def get_version
      cmd("show version")
    end

    def backup_config(tftp_url)
      cmd("copy startup-config #{tftp_url}")
    end

    def copy(from, to)
      cmd("copy #{from} #{to}")
    end

    def reload
      line = cmd("String" => "reload in 1", "Match" => /\[[Cc]onfirm\]/n)
      line += cmd("\n")
      line += cmd("show reload")
    end

  end
end
