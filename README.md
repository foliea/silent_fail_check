# SilentFailCheck

This gem aims to track and log silent failure.

https://rubygems.org/gems/silent_fail_check

## Installation

Add this line to your application's Gemfile:

    gem 'silent_fail_check'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install silent_fail_check

## Usage

SilentFailCheck is designed to work with ActiveRecord model. Only ActiveRecord >= 4.0.0 is supported.

### Setup

In order to use SilentFailCheck you should have a source table, similar to this:

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
class SilentFailLog < ActiveRecord::Base
  validates :message, presence: true
end
```

You can use SilentFailCheck like this:

`app/models/user.rb`

```ruby
require 'silent_fail_check'

class User < ActiveRecord::Base
  validates :connection_time, numericality: true

  silent_fail_check :validation, :connection_time
end
```

In this case, SilentFailCheck will check and log validation errors happened on :connection_time

### Configuration

Default configuration method is:

```ruby
SilentFailLog.configure
```

If your log model has a different schema, you can redefine columns:

```ruby
SilentFailLog.configure(
  model:   SilentFailLog,     # model class name as source
  message: 'MESSAGE_FIELD'    # field that contains name
)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
