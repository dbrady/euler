#!/usr/bin/env ruby
#
#  Created by cypher on 2007-03-10.
#  Copyright (c) 2007. All rights reserved.
#
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?

puts (2**1000).to_s.split(//).inject(0){|acc,n|acc+n.to_i}
