# SilentFailCheck

This gem aims to track and log silent failure.

## Installation

Add this line to your application's Gemfile:

    gem 'silent_fail_check'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install silent_fail_check

## Usage

For now, it's only working with ActiveRecord::Base objects.

Check this example below :

`app/models/setting.rb`:

```ruby
require 'silent_fail_check'

class Setting < ActiveRecord::Base
  after_save :reload

  validates :keyname, :value, presence: true
  validates :keyname, uniqueness: true

  silent_fail_check :validation, :keyname, :value
end
```

In this example, it will check and log validation errors happened on :keyname and :value 

Don't use it in production.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
