# Sieve of Eratosthenes. Fast, but needs RAM.
class Sieve
  # Build up the sieve. Must be called beforehand.
  def self.build_sieve(max)
    max = max + 1 # Our array is 0-based. Don't cut off max if prime
    @@sieve = Array.new(max,1)
    @@sieve[0] = 0
    @@sieve[1] = 0
    k = 2
    loop_max = max/2
    while k <= loop_max
      if @@sieve[k] == 1
        j = k+k
        while j < max
          @@sieve[j] = 0
          j += k
        end
      end
      k += 1
    end
  end
  
  # Returns true if n is Prime.
  def self.prime?(n)
    @@sieve[n] == 1
  end
  
  # Utility method. Get the sieve. (For debugging.)
  def self.sieve
    @@sieve
  end
end

class Integer
  def prime?
    Sieve.prime? self
  end

  # Return all primes less than self (noninclusive).
  # Rough terminology, I know. 
  def primes_below
    (2...self).select { |i| i.prime? }
  end

  # Return all primes up to (and possibly including) self
  # Rough terminology, I know. 
  def primes_under
    (2..self).select { |i| i.prime? }
  end
end

