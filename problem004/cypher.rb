#!/usr/bin/env ruby
#
#  Created by cypher on 2007-03-10.
#  Copyright (c) 2007. All rights reserved.
# 
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 x 99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.

class Fixnum
  def palindrome?
    self.to_s == self.to_s.reverse
  end
end

largest = 0

999.downto(100) do |a|
  999.downto(100) do |b|
    prod = a*b
    largest = prod if prod > largest if prod.palindrome?
  end
end

puts largest
