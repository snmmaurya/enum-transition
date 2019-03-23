<a href="https://badge.fury.io/rb/enum-transition"><img src="https://badge.fury.io/rb/enum-transition.svg" alt="Gem Version" height="18"></a>

# Enum::Transition
Active Record ENUM based state machine. Whether you can control enum transation from one state to another state. Suppose you have an user model and you want to once user has been rejected he can't be verified, You can achive this job easily using this library.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'enum-transition'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install enum-transition
```

## Usage

```ruby
# You have an user model and you want status transition should be verified or rejected from only initial

class User
  include Enum::Transition

  enum status: {initial: 0, verified: 1, rejected: 2]

  # Enum transition
  enum_columns [:status]
  enum_transitions :initial, [:verified, :rejected]
end

user = User.create(status: :initial)
user.verified!
user.rejected! # ActiveRecord::RecordInvalid: Validation failed: Status can't be changed from verified to rejected

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/snmmaurya/enum-transition. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
