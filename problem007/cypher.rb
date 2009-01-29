#!/usr/bin/env ruby
#
#  Created by cypher on 2007-03-10.
#  Copyright (c) 2007. All rights reserved.
# 
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# 
# What is the 10001st prime number?

require 'mathn'

class Prime
  def get
    @primes.last
  end
end

p=Prime.new
10001.times{p.succ} # slow!
puts p.get
