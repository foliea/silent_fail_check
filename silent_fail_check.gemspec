# -*- encoding: utf-8 -*-
require File.expand_path("../lib/silent_fail_check/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'silent_fail_check'
  s.version     = SilentFailCheck::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = "silent_fail_check"
  s.description = "Handle silent failure on ActiveRecord::Base"
  s.authors     = ["Adrien Folie"]
  s.email       = 'folie.adrien@gmail.com'
  s.homepage    = 'https://github.com/folieadrien/silent_fail_check'
  s.license     = 'MIT'

  s.add_development_dependency 'bundler', '~> 1.0'

  s.add_dependency 'activerecord', '~> 4.0'

  s.files        = ["lib/silent_fail_check.rb"]
  s.require_path = 'lib'
end
