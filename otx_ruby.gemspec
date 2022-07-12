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
  spec.homepage      = "https://github.com/mort666/otx_ruby"
  spec.license       = "Apache-2.0"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 2.3"
  spec.add_dependency "oj", "~> 3.13"

  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.16"
  spec.add_development_dependency "vcr", "~> 6.1"
  spec.add_development_dependency "webmock", "~> 3.14"
end
