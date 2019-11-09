# fzy.rb

A Ruby port of [fzy](https://github.com/jhawthorn/fzy)'s fuzzy finder scoring algorithm

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fzy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fzy

## Usage

`Fzy.has_match?(needle, haystack)`

``` ruby
Fzy.has_match?("rb", "ruby")  # => true
Fzy.has_match?("rb", "bar")   # => false
```

`Fzy.score(needle, haystack)`

``` ruby
Fzy.score("amuser", "app/models/user.rb")     # => 5.595
Fzy.score("amuser", "app/models/customer.rb") # => 3.655
```

`Fzy.positions(needle, haystack)`

``` ruby
Fzy.positions("amuser", "app/models/user.rb")     # => [ 0, 4, 11, 12, 13, 14 ]
Fzy.positions("amuser", "app/models/customer.rb") # => [ 0, 4, 12, 13, 17, 18 ]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jhawthorn/fzy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Fzy project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jhawthorn/fzy/blob/master/CODE_OF_CONDUCT.md).
