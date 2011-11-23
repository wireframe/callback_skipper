# callback_skipper

Programatically Skip ActiveRecord Callbacks

## Features
* easily skip callbacks
* useful for unit testing to skip long running processes

## Installation

gem 'callback_skipper'

## Usage

```ruby
class Foo < ActiveRecord::Base
  after_create :do_something_expensive
end

foo = Foo.new
foo.skip_callback :save, :after, :do_something_expensive
foo.save!
```
### Example: FactoryGirl Usage

https://github.com/thoughtbot/factory_girl

```ruby
# spec/factories/foo_factory.rb
Factory.define :foo do |f|
  f.after_build do |o|
    o.skip_callback :save, :after, :do_something_expensive
  end
end
```

## Contributing 

* Fork the project
* Fix the issue
* Add unit tests
* Submit pull request on github

See CONTRIBUTORS.txt for list of project contributors

## Copyright

Copyright (c) 2011 Ryan Sonnek. See LICENSE for details.
