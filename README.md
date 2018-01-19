# Consulta no site ReceitaWS - https://receitaws.com.br/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'receitaws'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install receitaws

## Usage

```
consulta = Receitaws::Api.consulta('27865757000102')
consulta.to_h
```

## Development

```
gem build receitaws.gemspec
gem install ./
gem install ./receitaws-0.0.1.gem
irb
require 'receitaws'
consulta = Receitaws::Api.consulta('27865757000102')
consulta.to_h

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/receitaws.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
