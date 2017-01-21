#!/usr/bin/env ruby

require "telnetdevice"

ip = ARGV[0]
password = ARGV[1]
device = TelnetDevice::Ruijie21.new(ip, password)

tftp_server= "222.26.20.9"
device.backup_config("tftp://#{tftp_server}/#{ip}.cfg")

ctrl_31_url = "tftp://#{tftp_server}/CTRL31.bin"
ctrl_33_url = "tftp://#{tftp_server}/CTRL33.bin"
s2126g_url = "tftp://#{tftp_server}/s21v18(1a2).bin"
device.upgrade_to_18_1a2(ctrl_31_url, ctrl_33_url, s2126g_url)
device.exit

puts "#{ip} has being upgraded, reloading now."
