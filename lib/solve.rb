#!/usr/bin/env/ruby

# ----------------------------------------------------------------------
# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?
# ----------------------------------------------------------------------

# Notes:

# Ouch. This will take some research. I once built a list of all the
# primes below 4 billion; this list could then be used to exhaustively
# determine primacy of any 64-bit number in a minute on a 100Mhz
# machine. Generating that list took about 10 hours, however, and the
# Euler challenge says everything should run in under a
# minute. There's got to be a way to do prime factorization, then.


# dbrady 2009-01-11: Okay, let's just brute force it for now....

num = 600851475143
sqrt = Math.sqrt(num).to_i


# build up the sieve to 775146.
class Sieve
  def self.build_sieve(max)
    @@sieve = Array.new(max,1)
    @@sieve[0] = 0
    @@sieve[1] = 0
    k = 2
    while k < max
      if @@sieve[k] == 1
        j = k+k
        while j < max
          @@sieve[j] = 0
          j += k
        end
      end
#      puts "Passing #{k}..." if k % 1000 == 0
      k += 1
    end
  end
  
  def self.prime?(n)
    begin
      @@sieve[n.floor] == 1
    rescue RangeError => e
      puts "WTF? Since when is #{n} too big to fit in a Fixnum?"
      raise e
    end 
  end
  
  def self.sieve
    @@sieve
  end
end

class Numeric
  def prime?
    Sieve.prime? self
  end

  def factors
    k = 1
    max = Math.sqrt(self).ceil
    facs = []
    while k <= max
      facs << k if (self.to_f/k) == (self.to_i/k)
      k += 1
    end
    facs
  end
end


puts "Building prime sieve up to #{sqrt}..."
Sieve.build_sieve sqrt

puts "Factoring 600851475143..."
f = 600851475143.factors

puts "Finding largest prime factor..."
puts f.select {|i| i.prime? }.max

# largest_factor = 1
# trial = 3
# while trial < sqrt
#   div = num.to_f / trial
#     largest_factor = trial if div == div.to_i && div.to_i.prime?
    
#   trial += 2
# end

# puts largest_factor


# puts Fixnum.sieve.size
# puts "Is 7 prime?: #{7.prime?}"
