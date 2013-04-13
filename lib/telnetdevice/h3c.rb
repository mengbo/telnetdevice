require "telnetdevice/base"

module TelnetDevice
  class H3C < Base
    def initialize(host, password)
      super(:host => host, :dump_log => "#{host}.log")
      login(password)
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
      close
    end

  end

end
