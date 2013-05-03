require 'net/telnet'

module TelnetDevice
  class Base
    def initialize(options)
      @telnet_options = {}
      @host = @telnet_options["Host"] = options[:host]
      if options.has_key?(:dump_log)
        @dump_log = @telnet_options["Dump_log"] = options[:dump_log]
      end
      @prompt = @telnet_options["Prompt"] = /[$%#>\]] *\z/n
      if options[:prompt]
        @prompt = @telnet_options["Prompt"] = options[:prompt]
      end
      @password_prompt = /[Pp]ass(?:word|phrase)[: ]*\z/n
      if options.has_key?(:waittime)
        @waittime = @telnet_options["Waittime"] = options[:waittime]
      else
        @waittime = @telnet_options["Waittime"] = 1
      end
      @telnet = Net::Telnet.new(@telnet_options)
    end

    def login(password)
      line = @telnet.waitfor(@password_prompt)
      line += cmd(password)
    end

    def cmd(options)
      if block_given?
        @telnet.cmd(options) {|c| yield c }
      else
        @telnet.cmd(options)
      end
    end

    def script(cmds)
      result = ""
      cmds.each_line do |line|
        cmd(line){ |c| result += c }
      end
      result
    end


    def close
      @telnet.close
    end

  end

end
