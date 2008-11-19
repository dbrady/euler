#!/usr/bin/env/ruby
# 
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.

class Fixnum
  def digit_at(place)
    p1 = 10**(place+1)
    n = self % 10**(place+1)
    if place > 0
      p0 = 10**place
      n = (n - self % p0) / p0
    end
    n
  end

  def palindrome?
    (0...digits).all? { |i| digit_at(i) == digit_at((digits-1)-i) }
  end

  def digits(base=10)
    (Math.log(self) / Math.log(base)).ceil
  end
end

999.downto(901) do |a|
  989.downto(900) do |b|
    if (a*b).palindrome?
      puts a*b
      exit
    end
  end
end

