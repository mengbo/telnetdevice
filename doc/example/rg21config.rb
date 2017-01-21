#!/usr/bin/env ruby

require "telnetdevice"

ip = ARGV[0]
password = ARGV[1]
device = TelnetDevice::Ruijie21.new(ip, password)

cmds = <<EOF
configure terminal
no enable services web-server
no ip access-list extended security
spanning-tree mode rstp
spanning-tree  
spanning-tree portfast bpduguard default
ip dhcp snooping
ip dhcp snooping address-bind
ip dhcp snooping verify mac-address
EOF

file = "#{ip}.cfg"
write = false
File.open(file) do |f|
  while line = f.gets
    write = true if line =~ /^interface/
    write = false if line =~ /^interface\ vlan/
    if write
      case line
      when /^interface/
        cmds += line
      when /switchport access vlan/
        cmds += " spanning-tree portfast\n ip verify source port-security\n"
      when /Anti-ARP-Spoofing ip/
        cmds += " no" + line
      when /switchport mode trunk/
        cmds += " ip dhcp snooping trust\n"
      when /!/
        cmds += line
      end
    end
  end
end

cmds += <<EOF
end
write
EOF

#cmds.each_line do |line|
  #device.cmd(line){ |c| print c }
#end
puts device.script(cmds)

device.exit

puts "#{ip} config has being changed."
