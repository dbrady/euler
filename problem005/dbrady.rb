#!/usr/bin/env ruby

# ----------------------------------------------------------------------
# 520 is the smallest number that can be divided by each of the
# numbers from 1 to 10 without any remainder.
# 
# What is the smallest number that is evenly divisible by all of the
# numbers from 1 to 20?
# ----------------------------------------------------------------------


# Find the smallest number that is evenly divisible by all of the
# numbers from 1 to 20. 

# Solution: Okay, we don't need to test numbers below 10 beceause for
# each of them has a multiple between 10 and 20. This is a naiive
# reduction of the factorization space, but it works.

# Next, we can skip over a bunch of numbers by stepping over 20 each
# iteration, because the numbers between obviously cannot be divided
# by 20; we can take this a step farther by noting that 19 and 20 only
# intersect every 380. I don't know if we can safely add in any extra
# multiples from there, so I won't. But that should give us a decent
# head start. There's probably a rule about using common factors to
# find the least common multiple that I can't remember it.

# dbrady 2008-10-13: Update. Yes, there are several ways to calculate
# the LCM of a group of numbers. One way is to factor each number into
# its prime factors, then take the highest exponent for each prime
# factor, and muliply those terms together. For example, 2,3,4,5,6 can
# be factored into
# 
# 2 = 2**1
# 3 =      3**1
# 4 = 2**2
# 5 =           5**1
# 6 = 2**1 3**1
#
# The LCM of these numbers is 2**2 * 3**1 * 5**1, or 60.
# 
# So a much more thinky way of solving the problem below is to work
# out the prime factors of each number, then take the max of each
# base, and build up that new number.

# Third, test the rarer numbers first for efficiency's sake.

i = 380

i+=380 while [18,17,16,15,14,13,12,11].any? {|n| !(i%n).zero? }

puts i
