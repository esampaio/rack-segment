# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/segment/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-segment'
  spec.version       = Rack::Segment::VERSION
  spec.authors       = ['Eduardo Sampaio']
  spec.email         = ['eduardo@sampa.io']

  spec.summary       = %q{Rack Middleware to inject Segment javascript into your Rack app.}
  spec.homepage      = 'https://github.com/esampaio/rack-segment'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rack'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'simplecov'
end
