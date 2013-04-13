require "bundler"
Bundler.setup

gemspec = eval(File.read("telnetdevice.gemspec"))

desc "Build the gem package and install it."
task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["telnetdevice.gemspec"] do
  system "gem build telnetdevice.gemspec"
  system "gem install telnetdevice-#{TelnetDevice::VERSION}.gem"
end
