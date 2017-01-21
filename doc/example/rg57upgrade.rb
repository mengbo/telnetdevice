#!/usr/bin/env ruby

require "telnetdevice"

ip = ARGV[0]
password = ARGV[1]
device = TelnetDevice::Ruijie57.new(ip, password)

tftp_server= "222.26.20.10"
device.backup_config("tftp://#{tftp_server}/#{ip}.cfg")

s5750_url = "tftp://#{tftp_server}/S5750_V10.4(2b2)_R102500.bin"
device.upgrade_os(s5750_url)
device.exit

puts "#{ip} has being upgraded, reloading now."
