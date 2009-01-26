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

# Retooled for n**6!
# 9999999 => 3720087, so 7 digits is our max; call it 3999999. See
# solve.rb for the logic here.

@powers = (0..9).map {|i| i**6 }

def psum(n)
  # 21.528s under MRI 1.8
  #  5.312s under MRI 1.9
  # 13.631s under jruby
  # Okay, optimization time. This runs in about 1.38 seconds.
  sum = 0
  while n > 0
    sum += @powers[n % 10]
    n /= 10
  end
  sum
end

sumses = []
2.upto(3_999_999) do |i|
  sumses << i if psum(i) == i
end
puts sumses.sum


