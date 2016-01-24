# Open Threat Exchange (OTX) Ruby Wrapper

Open Threat Exchange is an open community that allows participants to learn about the latest threats, research indicators of compromise observed in their environments, share threats they have identified, and automatically update their security infrastructure with the latest indicators to defend their environment.

This gem provides a wrapper for Ruby applications to pull pulses from OTX and be consumed by the ruby application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'otx_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install otx_ruby

## Usage

```ruby
  require `otx_ruby`

  api_key = '4xxx........'
  otx = OTX::Subscribed.new(apikey)

  # Get all subscribed pulses
  pulses = otx.get_all

  # Read contents of a single pulse
  pulse_id = '56xxxx..........'
  pulses = OTX::Pulses.new(apikey)

  pulse = pulses.get_pulse(pulse_id)
```

## API Key

Library requires your API key this can be found in your settings page https://otx.alienvault.com/settings

## API Timestamp

The API uses ISO Format timestamps, however there is a quirk, the API seems to use Python style timestamps as a result it is important to ensure that the sent time stamp uses the UTC format when sent

```
"2010-10-25T23:48:46Z"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mort666/otx_ruby.

## Copyright

Copyright (c) 2015-2016 Stephen Kapp. See LICENSE for details.
