# Easystats [![Build Status](https://secure.travis-ci.org/mgrigajtis/easystats.png)](https://secure.travis-ci.org/mgrigajtis/easystats) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/mgrigajtis/easystats) 

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
  weighted_moving_average
].each do |method|
  puts "#{method}: #{array.send(method.to_sym)}"
end
```

This will result in:

```sh
average: 21.428571428571427
median: 16
mode: 42
range: 38
standard_deviation: 15.295501984321435
sum: 150
variance: 200.53061224489798
weighted_moving_average: 30.476190476190474
```
