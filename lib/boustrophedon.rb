#!/usr/bin/env ruby

# Boustrophedon Transform

# http://en.wikipedia.org/wiki/Boustrophedon_transform

# boustrophedon: adj. "From right to left and from left to right in
# alternate lines."

# Given a sequence of numbers (a0, a1, a2, ...), return a new sequence
# of numbers (b0, b1, b2, ...) by filling up a triangle of sums where
# the direction changes on each now.

# Put a0 at the top, then a1 on the right. Add them together to get b1:
#
#    a0
#   /
# b1 <- a1
#
# Now take a2 and put it on the left, and sum the numbers towards the
# right to reach b2:
#

#        a0
#       /
#     b1 <- a1
#       \     \
#  a2 ->T2,1-> b2

# T(2,1) is just a temporary storage cell, but T(k,n) actually defines
# a recurrence relation. Assuming k>=0 and n>=0 where k is the row and
# n is the L->R or R->L position, then

# T(k,0) = ak # because n==0 is where a gets "input" to each row
# T(k,n) = T(k,n-1) + T(k-1,k-n) # have to flip k-n because each row
# reverses direction.

# Entringer Numbers are what you get out if you put a 1 in a0 and
# zeroes for all other inputs.


class Array
  def boustrophedon
    (0...size).map {|k| boustrophedon_at k, k }
  end

  # Returns the value of the Boustrophedon transform at T(k,n) where
  # k < size and k >= n >= 0.
  def boustrophedon_at(k,n)
    raise ArgumentError.new "k must be < size" unless k < size
    raise ArgumentError.new "n must be < size" unless n < size
    return 0 if n < 0 || k < n
    @b_cache ||= []
    @b_cache[k] ||= []

    @b_cache[k][n] ||= if k==0
                         self[k]
                       else
                         boustrophedon_at(k,n-1) + boustrophedon_at(k-1,k-n)
                       end
  end
end
