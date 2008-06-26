#!/usr/bin/env ruby
#
#  Created by cypher on 2007-03-10.
#  Copyright (c) 2007. All rights reserved.
# 
# The sum of the squares of the first ten natural numbers is,
# 1² + 2² + ... + 10² = 385
# 
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)² = 55² = 3025
# 
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
# 
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

class Integer
  def square
    self*self
  end
end

puts( (1..100).inject(0){|acc,n|acc+n}.square - (1..100).inject(0){|acc,n| acc + n.square} )
