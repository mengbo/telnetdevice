#!/usr/bin/env ruby

require "telnetdevice"

ip = ARGV[0]
password = ARGV[1]
device = TelnetDevice::H3C.new(ip, password)

ftp_server= "222.26.20.9"
device.ftp_login(ftp_server)
device.ftp_put("vrpcfg.txt", "/upload/#{ip}.txt")
device.ftp_logout
device.quit
puts "#{ip} vrpcfg.txt has being backuped."
