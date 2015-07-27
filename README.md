# Uberscore

```ruby
# Without Uberscore
%w[0x 0d ea].map { |element| element.hex.divmod(13)[1] == 0 }
# With Uberscore
%w[0x 0d ea].map(&_.hex.divmod(13)[1] == 0)

[Array, Hash].map { |a_class| a_class.new(4) }
[Array, Hash].map(&_.new(4))

[[2, 3]].map { |array| array.map { |element| element * 2 } }
[[2, 3]].map(&_.map(&_ * 2))
```

## Installation

Add this line to your application's Gemfile:

    gem 'uberscore'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uberscore

## License

MIT
