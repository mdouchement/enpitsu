# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enpitsu/version'

Gem::Specification.new do |spec|
  spec.name          = 'enpitsu'
  spec.version       = Enpitsu::VERSION
  spec.authors       = ['mdouchement']
  spec.email         = ['marc.douchement@predicsis.com']
  spec.summary       = %(q{Image gallery metadata editor})
  spec.description   = %(q{Image gallery metadata editor})
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%(r{^bin/})) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%(r{^(test|spec|features)/}))
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.2'

  spec.add_dependency 'green_shoes', '1.1.374'

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '10.0'
  spec.add_development_dependency 'rubocop', '0.29.1'
end
