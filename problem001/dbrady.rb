#!/usr/bin/env ruby
require '../lib/enumerable'

# ----------------------------------------------------------------------
# If we list all the natural numbers below 10 that are multiples of 3
# or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# 
# Find the sum of all the multiples of 3 or 5 below 1000.
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# ruby   : 0.088s
# ruby1.9: 0.025s
# jruby  : 0.616s
# rbx    : 0.440s
# tinyrb : -.---s (DNF)
puts (1..999).to_a.delete_if { |i| !((i%3).zero? || (i%5).zero?) }.sum
