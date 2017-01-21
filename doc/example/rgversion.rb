#!/usr/bin/env ruby

require "telnetdevice"

ip = ARGV[0]
password = ARGV[1]
device = TelnetDevice::Ruijie.new(ip, password)

puts device.get_version
device.exit
