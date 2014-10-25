# Defp

An pattern matching implementation in ruby inspired by haskell

## Installation

Add this line to your application's Gemfile:


```ruby
gem 'CallBaecker'
gem 'defp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install defp
    $ gem install CallBaecker

## Usage

```ruby
class Example
  # please extend/include in this order
  extend Defp
  include CallBaecker

  # With normal params
  def normal_params(value1, value2)
  defp('hallo', _) == 'bubu1'
  defp(_, 'hallo') == -> {
    'bubu2'
  }
    'bubu3'
  end

  # With keyword arguments
  def self.keyword_params(value1: ,value2:)
    defp(value1: 'hallo', value2: _) == 'bubu1' # you can specify blank vars
    defp(value2: 'hallo') == -> { 'bubu2' }     # or not specifying them at all
      'bubu3'
  end

  # With mixed params
  def self.mixed_params(value1 = {}, value2, value3)
    defp({value2: 'hallo'}, 'dud', _) == 'bubu1'
    'bubu2'
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/defp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
