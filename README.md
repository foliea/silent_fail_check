# SilentFailCheck 
[![Build Status](https://travis-ci.org/foliea/silent_fail_check.svg?branch=master)](https://travis-ci.org/foliea/silent_fail_check)
[![Gem Version](https://badge.fury.io/rb/silent_fail_check.svg)](http://badge.fury.io/rb/silent_fail_check)
[![Code Climate](https://codeclimate.com/github/foliea/silent_fail_check.png)](https://codeclimate.com/github/foliea/silent_fail_check)
[![Test Coverage](https://codeclimate.com/github/foliea/silent_fail_check/badges/coverage.svg)](https://codeclimate.com/github/foliea/silent_fail_check)

This gem aims to track and log silent failure.

## Installation

Add this line to your application's Gemfile:

    gem 'silent_fail_check'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install silent_fail_check

## Usage

`SilentFailCheck` is designed to work with `ActiveRecord` models. Only `ActiveRecord` >= `4.0.0` is supported.

### Setup

In order to use `SilentFailCheck` you should have a source table, similar to this:

```ruby
class CreateSilentFailLog < ActiveRecord::Migration
  def self.up
    create_table :silent_fail_logs do |t|
      t.string :message
      t.timestamps
    end
  end

  def self.down
    drop_table :silent_fail_logs
  end
end
```

Simple model with validations should look like this:

```ruby
require 'silent_fail_check'

class SilentFailLog < ActiveRecord::Base
  validates :message, presence: true
end
```

You can use `SilentFailCheck` like this:

`app/models/user.rb`

```ruby
class User < ActiveRecord::Base
  validates :connection_time, numericality: true

  silent_fail_check :validation, :connection_time
end
```

In this case, `SilentFailCheck` will check and log validation errors happened on `:connection_time`

### Configuration

Default configuration method is:

```ruby
SilentFailCheck::Logger.configure
```

If your log model has a different schema, you can redefine columns:

```ruby
SilentFailCheck::Logger.configure(
  model:   SilentFailLog,     # model class name as source
  message: 'MESSAGE_FIELD'    # field that contains name
)
```

### Tests

To run the test suite:

    bundle install
    
Then:
    
    bundle exec rspec

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Licensing

silent_fail_check is licensed under the MIT License. See LICENSE for full license text.
