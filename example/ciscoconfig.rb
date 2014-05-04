#!/usr/bin/env ruby

#$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
#require "rubygems"
require "telnetdevice"

ip = ARGV[0]
password = ARGV[1]
device = TelnetDevice::CISCO.new(ip, password) 

device.cmd("show startup-config"){ |c| print c }
puts
device.exit
