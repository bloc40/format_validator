# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'format_validator/version'

Gem::Specification.new do |spec|
  spec.name          = 'format_validator'
  spec.version       = FormatValidator::VERSION
  spec.authors       = ['Jamal El Milahi']
  spec.email         = ['jamal@elmilahi.com']
  spec.description   = %q{Active Model missing format validators}
  spec.summary       = %q{format_validator is a gem that adds the missing format validators to Active Model}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
