#!/usr/bin/env ruby

# ----------------------------------------------------------------------
# ruby   : 0.087s
# ruby1.9: 0.337s
# jruby  : -.---s (DNF)
# rbx    : -.---s (DNF)
# tinyrb : -.---s (DNF)


# A curious fraction is one in which a single digit is cancelled as if
# it were a factor, and the result is still the correct fraction. For
# example, 49 / 98 => 4 / 8 by cancelling the 9's.
# 
# Note that, while 30 / 50 => 3 / 5, this is considered a trivial
# example and should be ignored.

# There are four curious fractions less than 1 with 2-digit numerator
# and denominator. Find these four fractions, take their product, and
# find the value of their denominator.

fractions = []

11.upto(99) do |y|
  10.upto(y-1) do |x|
    r1 = Rational(x,y)
    trials = []
    next if r1.numerator == x # irreducible
    
    xa,xb = x/10, x%10
    ya,yb = y/10, y%10

    trials = [[xa,ya,xb,yb],
              [xa,yb,xb,ya],
              [xb,ya,xa,yb],
              [xb,yb,xa,ya]]
    trials.each do |a,b,c,d|
      if a!=0 && d!=0 && a==b 
        r2 = Rational(c,d)
        if r1 == r2
          fractions << [x,y] 
        end
      end
    end
  end
end

# fractions.each do |x,y|
#   puts "#{x}/#{y}"
# end

puts fractions.map {|x,y| Rational(x,y)}.inject{|a,b| a*b}
