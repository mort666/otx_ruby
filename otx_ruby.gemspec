# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'otx_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "otx_ruby"
  spec.version       = OTX::VERSION
  spec.authors       = ["Stephen Kapp"]
  spec.email         = ["mort666@virus.org"]
  spec.summary       = %q{AlienVault OTX Ruby Gem}
  spec.description   = %q{AlienVault Open Threat Exchange Threat Intel feed API Wrapper}
  spec.homepage      = "http://github.com/mort666/otx_ruby"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "oj", "~> 2.14"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.8"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 1.22"
end
