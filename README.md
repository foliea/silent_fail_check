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

For now, it's only working with ActiveRecord::Base objects.

Check this example below:

`app/models/user.rb`

```ruby
require 'silent_fail_check'

class User < ActiveRecord::Base
  validates :connection_time, numericality: true

  silent_fail_check :validation, :connection_time
end
```

In this example, it will check and log validation errors happened on :connection_time

Don't use it in production. It's a first draft, logging isn't available yet.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
