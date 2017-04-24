# Slackgetter

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/slackgetter`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slackgetter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slackgetter

## Usage

### Setting environment variable

Generate token with [legacy token generator](https://api.slack.com/custom-integrations/legacy-tokens).

Edit `~/.bash_profile` (or `~/.zshrc` if you use zsh) to set `SLACK_TOKEN` environment variable:

```
export SLACK_TOKEN=<generated-token>
```

### Examples to get messages

Getting messages in `general` channel from just one day ago to now:

```
$ slackgetter time general
```

Getting messages in `general` channel from `2017-04-01 12:00:30` to now:

```
$ slackgetter time general `2017-04-01 12:34:56`
```

Getting messages in `general` channel from `2017-04-01 0:00` to `2017-04-01 9:00`:

```
$ slackgetter time general 2017-04-01 '2017-04-01 9:00'
```

Getting messages with URL in `general` channel from `https://t-okuaki.slack.com/archives/XXXXXXXXX/p1492065698851926` to `https://t-okuaki.slack.com/archives/XXXXXXXXX/p1492095485531747`:

```
$ slackgetter url general https://t-okuaki.slack.com/archives/XXXXXXXXX/p1492065698851926 https://t-okuaki.slack.com/archives/XXXXXXXXX/p1492095485531747
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/t-okuaki/slackgetter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
