# frozen_string_literal: true
Gem::Specification.new do |s|
  s.name = 'iracing_gem'
  s.author = 'Craig Isenor'
  s.version = '0.0.1'
  s.date = '2019-11-01'
  s.summary = "Connect to iRacing's JSON API with Ruby"
  s.files = Dir.glob("{spec,lib}/**/*")
  s.require_path = 'lib'
  s.add_runtime_dependency "dry-container", "~> 0.7.2"
  s.add_runtime_dependency "faraday", "~> 0.17.0"
  s.add_development_dependency "rspec", '~> 3.9'
end
