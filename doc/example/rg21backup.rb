#!/usr/bin/env ruby

require "telnetdevice"

ip = ARGV[0]
password = ARGV[1]
device = TelnetDevice::Ruijie21.new(ip, password)

tftp_server= "202.118.48.232"
device.backup_config("tftp://#{tftp_server}/#{ip}.cfg")
device.exit
puts "#{ip} startup-config has being backuped."
