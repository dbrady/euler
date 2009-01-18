#!/usr/bin/env ruby
require '../lib/enumerable'

# How many different ways can you make change for $2 given coin
# denominations of 1, 2, 5, 10, 20, 50, 100, and 200?

COINAGE = [200, 100, 50, 20, 10, 5, 2, 1]

# ----------------------------------------------------------------------
# Performance Note: I originally had the second base case as
# 
# elsif amount == 1
#   [[1]]
# 
# This is a pretty standard "recursive thinking" approach to the
# problem.
# 
# In the "penny case", cases where largest=1, the else clause would
# decrement the amount until it reached zero, and ultimately would
# return exactly one solution: an array of pennies adding up to
# amount.
# 
# The program spent two thirds of its execution time in that recursion
# case, so I optimized it to
# 
# elsif amount == 1 || largest == 1
#   [[1] * amount]
# 
# The results are dramatic:
#
# interpreter        with [[1]]            with [[1] * amount]
# MRI 1.8            28.380                8.562
# JRuby              26.016                8.667  
# MRI 1.9            22.128                8.142

def change(amount, largest)
  # If amount is zero, return [].
  # If amount is 1, return [1].
  # else
  #    for each coin <= largest && <= amount,
  #        get all solutions for (amount-coin, coin)
  #        put coin at the head of each
  #
  if amount == 0
      [[]]
  elsif amount == 1 || largest == 1
    [[1] * amount]
  else 
    coins = COINAGE.reject { |c| c > largest || c > amount }
    changes = []
    coins.each do |coin|
      # get all solutions for each coin, then prepend this coin to
      # each solution and return the new list of solutions
      change(amount-coin, coin).each do |change_made|
        changes << change_made.dup.unshift(coin)
      end
    end
    changes
  end
end

solutions = change(200, 200)
# solutions.each do |c|
#   puts c * ','
# end
# puts '--'

puts "#{solutions.size} solutions"


