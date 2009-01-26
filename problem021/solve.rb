#!/usr/bin/env ruby
require '../lib/enumerable'
require '../lib/integer'

# Evaluate the sum of all the amicable numbers under 10000

def solve1
  # 1.997s under MRI 1.8
  # 0.771s under MRI 1.9
  # 1.919s under jruby
  puts (1..10000).to_a.select { |n| n.amicable? }.sum
end

def solve2
  # 1.959s MRI 1.8
  # 0.718s MRI 1.9
  # 1.911s jruby
  sum = 0
  1.upto(10000) {|n| sum += n if n.amicable? }
  puts sum
end

solve2
