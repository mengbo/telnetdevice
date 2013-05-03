require "telnetdevice/base"

module TelnetDevice
  class H3C < Base
    def initialize(host, password)
      super(:host => host, :dump_log => "#{host}.log", :prompt => /[>\]] *\a*\z/n)
      login(password)
      system_view
      cmd("user-interface vty 0 4")
      cmd("screen-length 0")
      cmd("return")
    end

    def ftp_login(server, user = "anonymous", password = "")
      line = cmd("String" => "ftp #{server}", "Match" => /[Uu]ser\(.*\): *\z/n)
      line += cmd("String" => user, "Match" => @password_prompt)
      line += cmd(password)
    end

    def ftp_logout
      line = cmd("bye")
    end

    def ftp_put(local_file, remote_file)
      line = cmd("put #{local_file} #{remote_file}")
    end

    def system_view
      cmd("system-view")
    end

    def quit
      system_view
      cmd("user-interface vty 0 4")
      cmd("undo screen-length")
      cmd("return")
      close
    end

    alias_method :exit, :quit

  end

end
