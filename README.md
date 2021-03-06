# Rack::Segment

Rack Middleware to inject Segment javascript into your Rack app

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-segment'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-segment

## Usage

### Rack/Sinatra/Etc...

Add this to your app.

```ruby
use Rack::Segment, key: 'YOUR_KEY'
```

### Rails

Add this to your app's config files:

```ruby
config.middleware.use 'Rack::Segment', key: 'YOUR_KEY'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/esampaio/rack-segment.

## Credits

Heavily based on [onthebeach/rack_google_tag_manager](https://github.com/onthebeach/rack_google_tag_manager).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

