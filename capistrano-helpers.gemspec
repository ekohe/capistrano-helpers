# encoding: UTF-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'capistrano-helpers/version'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-helpers'
  spec.version       = CapistranoHelpers::VERSION
  spec.authors       = %w(maverick vincent)
  spec.email         = %w(maverick@ekohe.com v.zh@msn.com)
  spec.summary       = %q{Provide helper tasks for Capistrano 3}
  spec.description   = %q{Provide helper tasks for Capistrano 3}
  spec.homepage      = 'https://github.com/ekohe/capistrano-helpers'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'capistrano', '>= 3.2.0'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
