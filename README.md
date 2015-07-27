# Defp

[![Build Status](https://travis-ci.org/doodzik/defp.svg?branch=master)](https://travis-ci.org/doodzik/defp)

An pattern matching implementation in ruby inspired by haskell.
If you want to know about the inner workings of defp [check out this blog post](http://dudzik.co/blog/2014/10/27/i-went-on-a-journey-to-haskell-and-all-i-got-was-a-pattern-matcher-for-ruby/).

## Installation

Add this line to your application's Gemfile:


```ruby
gem 'defp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install defp

## Usage

```ruby
class Example
  extend Defp

  # With normal params
  def  normal_params(value1, value2)
  defp              ('hallo', _    ) == 'foo'
  defp              (_, 'hallo'    ) == -> do
    'bar'
  end
    'baz'
  end

  # With keyword arguments
  def self.keyword_params(value1: ,value2:)
  defp(value1: 'hello', value2: _) == 'foo' # you can specify blank vars
  defp(value2: 'hello')            == -> { 'bar' }     # or not specifying them at all
    'baz'
  end

  # With mixed params
  def self.mixed_params(value1 = {}, value2, value3)
  defp({value2: 'hallo'}, 'dud', _) == 'foo'
    'bar'
  end
end
```

## Contributing

1. Fork it ( https://github.com/doodzik/defp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
