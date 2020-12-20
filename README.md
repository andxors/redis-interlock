# Redis::Interlock
Implementation of mutex in Redis.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'redis-interlock'
```

And then execute:

    bundle install

Or install it yourself as:

    gem install redis-interlock

## Usage

To use the lock redis:
```ruby
mutex = Redis::Interlock.new(redis: Redis.new, name: 'lock_name', seconds: 60)
mutex.lock! { 'some_code' }
```
or
```ruby
redis = Redis.new
redis.lock!(name: 'lock_name', seconds: 60) { 'some_code' }
```

If the lock is already set, raise an exception `Redis::Interlock::Error`.

## Development and Testing

To start the interactive development console, use the command:

    make console

To test the proper performance of the code, use [rspec](https://rubygems.org/gems/rspec).

    make rspec

To check the coding style, use [rubocop](https://rubygems.org/gems/rubocop).

    make rubocop

To check the security of the code, use [bundle-audit](https://rubygems.org/gems/bundle-audit).
    
    make audit

To check code coverage by tests, use [simplecov](https://rubygems.org/gems/simplecov). The result of her work can be viewed in `coverage/index.html`.

All checks are run with the following command:

    make check

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/underluns/redis-interlock).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
