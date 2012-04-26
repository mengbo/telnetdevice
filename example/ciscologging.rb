#!/usr/bin/env ruby

require "telnetdevice"

ip = ARGV[0]
password = ARGV[1]
device = TelnetDevice::CISCO.new(ip, password) 

tftp_server= "222.26.20.9"
device.cmd("show logging"){ |c| print c }
puts
device.exit
