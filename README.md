# Easystats

> Created by [Matthew Grigajtis](http://www.matthewgrigajtis.com)

Provides easy to use statistical functions to use on an array 

## Install

In your shell:

```sh
gem install easystats
```

or in your Gemfile:

```rb
gem 'easystats'
```

## Example

```rb
require 'easystats'

array = [4, 8, 15, 16, 23, 42, 42]

%w[
  average
  median
  mode
  range
  standard_deviation
  sum
  variance
].each do |method|
  puts "#{method}: #{array.send(method.to_sym)}"
end
```
