#!/usr/bin/env ruby
#
#  Created by cypher on 2007-03-10.
#  Copyright (c) 2007. All rights reserved.
# 
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# 
# What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?

class Integer
  def divisible?
    self % 19 == 0 &&
    self % 18 == 0 &&
    self % 17 == 0 &&
    self % 16 == 0 &&
    self % 15 == 0 &&
    self % 14 == 0 &&
    self % 13 == 0 &&
    self % 12 == 0 &&
    self % 11 == 0
  end
end

curr = 20

curr += 20 until curr.divisible?

puts curr
