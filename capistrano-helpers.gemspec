# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/helpers/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-helpers"
  spec.version       = Capistrano::Helpers::VERSION
  spec.authors       = ["maverick"]
  spec.email         = ["maverick@ekohe.com"]
  spec.summary       = %q{Provide helper tasks for Capistrano 3 }
  spec.description   = %q{Provide helper tasks for Capistrano 3 }
  spec.homepage      = "https://github.com/maverick9000/capistrano-helpers"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "capistrano", ">= 3.2.0"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
