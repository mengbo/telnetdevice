require File.expand_path("../lib/telnetdevice/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'telnetdevice'
  s.version     = TelnetDevice::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Meng Bo"]
  s.email       = 'mengbo@lnu.edu.cn'
  s.homepage    = "https://github.com/mengbo/telnetdevice"
  s.summary     = "Ruby telnet tool."
  s.description = "Ruby telnet tool, for CISCO/Ruijie/H3C network deivce."

  s.required_rubygems_version = ">= 1.3.6"

  # lol - required for validation
  s.rubyforge_project         = "telnetdevice"

  # If you have other dependencies, add them here
  # s.add_dependency "another", "~> 1.2"

  # If you need to check in files that aren't .rb files, add them here
  s.files        = Dir["{lib}/**/*.rb", "bin/*", "example/*", "*.md"]
  s.require_path = 'lib'

  # If you need an executable, add it here
  s.executables = ["telnetdevice"]

  # If you have C extensions, uncomment this line
  # s.extensions = "ext/extconf.rb"
end
