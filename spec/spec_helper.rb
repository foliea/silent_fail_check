require 'pry'
require 'silent_fail_check'
require 'coveralls'

Coveralls.wear! if ENV['COVERALLS_REPO_TOKEN']
I18n.enforce_available_locales = false

ActiveRecord::Base.establish_connection(adapter: 'sqlite3',
                                        database: File.dirname(__FILE__) + '/silent_fail_check.sqlite3')

load File.dirname(__FILE__) + '/support/schema.rb'
load File.dirname(__FILE__) + '/support/models.rb'
load File.dirname(__FILE__) + '/support/data.rb'
