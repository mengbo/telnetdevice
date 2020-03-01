# coding: utf-8
lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'telnetdevice/version'

Gem::Specification.new do |spec|
  spec.name          = "telnetdevice"
  spec.version       = TelnetDevice::VERSION
  spec.authors       = ["Meng Bo"]
  spec.email         = ["mengbo@lnu.edu.cn"]

  spec.summary       = %q{Ruby telnet tool.}
  spec.description   = %q{Ruby telnet tool, for CISCO/Ruijie/H3C network deivce.}
  spec.homepage      = "https://github.com/mengbo/telnetdevic"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "net-telnet", "~> 0.1.1"

  spec.add_development_dependency "bundler", ">= 1.13"
  spec.add_development_dependency "rake", ">= 12.3.3"
end
