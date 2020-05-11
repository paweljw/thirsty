# Thirsty

A quick and dirty command to track your water intake on the CLI.

## Installation

Install it for your CLI with:

    $ gem install thirsty

Then set your daily water requirement with:

```
    $ thirsty update_requirement 2.5
```
## Usage

Note drinking some water with:

```
    $ thirsty add 1.5 # liters
    $ thirsty add 330 # will automatically consider values higher than 3 to be milliliters
```
Check how you're doing with:
```
    $ thirsty today
```

## Development

After checking out the repo, run `bundle install` to install dependencies. 
To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/thirsty.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
