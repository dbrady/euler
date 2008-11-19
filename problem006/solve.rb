#!/usr/bin/env ruby

# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385

# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025

# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

class Array
  def sum
    self.inject {|a,b| a+b }
  end
end

puts (1..100).to_a.sum**2 - (1..100).map {|i| i**2}.sum
