# Uberscore

Born to make your Ruby blocks more concise.

```ruby
# Chain method calls.
%w[0x 0d ea].map { |element| element.hex.divmod(13)[1] == 0 } # Without Uberscore
%w[0x 0d ea].map(&_.hex.divmod(13)[1] == 0) # With Uberscore

# Use class methods.
[Array, Hash].map { |a_class| a_class.new(4) }
[Array, Hash].map(&_.new(4))

# Nest.
[[2, 3]].map { |array| array.map { |element| element * 2 } }
[[2, 3]].map(&_.map(&_ * 2))

# Subscript.
[{ name: "foo" }, { name: "bar" }].map { |hash| hash[:name] }
[{ name: "foo" }, { name: "bar" }].map(&_[:name])
```

# Name Conflict
The method name `_` conflicts with the last expression shortcut in Pry and IRB.
If you wish to name the method differently, define the constant `UBERSCORE_METHOD_NAME`
before requiring the gem.

```ruby
UBERSCORE_METHOD_NAME = :it # or any other name.

require "uberscore"

[{ name: "foo" }, { name: "bar" }].map(&it[:name])
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
