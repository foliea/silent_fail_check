# -*- encoding: utf-8 -*-
require File.expand_path('../lib/silent_fail_check/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'silent_fail_check'
  s.version     = SilentFailCheck::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'silent_fail_check'
  s.description = 'Handle silent failure on ActiveRecord models'
  s.authors     = ['Adrien Folie']
  s.email       = 'folie.adrien@gmail.com'
  s.homepage    = 'https://github.com/folieadrien/silent_fail_check'

  s.add_development_dependency 'bundler', '~> 1.0'
  s.add_development_dependency 'rspec', '~> 2.3'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pry'

  s.add_dependency 'activerecord', '~> 4.0'

  s.files = [
    'lib/silent_fail_check.rb',
    'lib/silent_fail_logger.rb'
  ]
  s.require_path = 'lib'
end
