# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fake_tracking_services/version'

Gem::Specification.new do |spec|
  spec.name          = 'fake_tracking_services'
  spec.version       = FakeTrackingServices::VERSION
  spec.authors       = ['ArmandPredicSis']
  spec.email         = ['armand.bourquin@predicsis.com']
  spec.summary       = ''
  spec.description   = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['fake_tracking_services']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'sinatra', '1.4.5'
  spec.add_dependency 'unicorn', '~> 0'
  spec.add_dependency 'postmark', '~> 0'
  spec.add_dependency 'json', '~> 1.8'
  spec.add_dependency 'mixpanel_client', '~> 4.1'
  spec.add_dependency 'foreman', '~> 0'
end
