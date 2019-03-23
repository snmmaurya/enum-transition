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

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
