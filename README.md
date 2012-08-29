# callback_skipper

Programatically Skip ActiveRecord Callbacks

## Features
* easily skip callbacks
* useful for unit testing to skip long running processes

## Installation

```ruby
# Gemfile
gem 'callback_skipper'
```

## Usage

```ruby
class Foo < ActiveRecord::Base
  after_create :do_something_expensive
end

foo = Foo.new
foo.skip_callback :save, :after, :do_something_expensive
foo.save!
```
### Error handling
If the code attempts to skip an undefined callback, a **CallbackSkipper::CallbackMethodNotDefined** will be raised:

```ruby
# class Foo is defined above
foo = Foo.new
begin
  foo.skip_callback :save ,:after, :method_that_is_not_defined
rescue CallbackSkipper::CallbackMethodNotDefined
  puts "You should not skip callback methods that are not defined
end
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
