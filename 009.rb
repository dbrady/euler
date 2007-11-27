#!/usr/bin/env ruby
#
#  Created by cypher on 2007-03-10.
#  Copyright (c) 2007. All rights reserved.
# 
# A Pythagorean triplet is a set of three natural numbers, a<b<c, for which,
# a² + b² = c²
# 
# For example, 3² + 4² = 9 + 16 = 25 = 5².
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.


3.upto(998) do |c| # a and b are at least 1, so c can be 998 at best
  1.upto(c-1) do |b|
    1.upto(b-1) do |a|
      if a + b + c == 1000 && a**2 + b**2 == c**2
        puts a*b*c
        exit
      end
    end
  end
end
