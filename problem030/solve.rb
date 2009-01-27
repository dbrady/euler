#!/usr/bin/env ruby
require '../lib/symbol'
require '../lib/enumerable'

# ----------------------------------------------------------------------
# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
# 
#     1634 = 1^(4) + 6^(4) + 3^(4) + 4^(4)
#     8208 = 8^(4) + 2^(4) + 0^(4) + 8^(4)
#     9474 = 9^(4) + 4^(4) + 7^(4) + 4^(4)
# 
# As 1 = 1^(4) is not a sum it is not included.
# 
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
# 
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
# ----------------------------------------------------------------------

# Notes:
# 
# 9**5 is 59049; The largest possible digits-power-5-sum number is 5
# digits long. This is because 99999 sums out to 295245 while 999999
# only sums out to 354294. So, we know we can constrain our search to
# 99999 and below. --HA! Not true. There's a 6-digit number up there.
# We need to constrain to 354294 and below. Hmm, but the psum of
# 399999 is 295488, so we can actually constrain to 299999. The psum
# of this is 295277, so 299999 is probably a safe cap to work from.
@powers = (0..9).map {|i| i**5 }

def psum(n)
  # I can think of several C and perl tricks to port here that would
  # be very fast, but for now I want it readable.
  
  # This code runs in about 7.35 seconds.
  # digits = n.to_s.split(//).map(&:to_i)
  # sum = digits.map {|i| @powers[i]}.sum
  
  # Okay, optimization time. This runs in about 1.38 seconds.
  sum = 0
  while n > 0
    sum += @powers[n % 10]
    n /= 10
  end
  sum
end

sumses = []
2.upto(299999) do |i|
  sumses << i if psum(i) == i
end
puts sumses.sum


