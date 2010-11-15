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
    @@primes = (max-1).primes_below
  end
  
  # Returns true if n is Prime.
  def self.prime?(n)
    if n < @@sieve.size
      @@sieve[n] == 1
    else
      !@@primes.any? {|p| (n % p) == 0 }
    end
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
  
  # Integer.factors returns a sorted list of all factors of self.
  # factors[0] is always 1 and factors[1] is always prime. If self is
  # prime, factors[1] == self. So we just cdr down the factors list,
  # appending a list of factors as we go.
  # 
  # 144.prime_factors
  # => [2, 2, 2, 2, 3, 3]
  def prime_factors
    next_factor = factors[1]
    if self == next_factor
      return [self]
    else
      return [next_factor] + (self/next_factor).prime_factors
    end
  end

  # Return a hash of prime => exponent pairs. E.g.
  # 140.prime_factors
  # => { 2 => 2, 5 => 1, 7 => 1 }
  def prime_factor_hash
    exponents = Hash.new(0)
    self.prime_factors.each do |f|
      exponents[f] += 1
    end
    exponents
  end
  
  # Returns a string expression of the prime factorization.
  # 
  # 144.prime_factor_string
  # => 2**2 * 3**4
  def prime_factor_string
    prime_factor_hash.sort_by {|base, exp| base }.map {|base, exp| "#{base}**#{exp}"} * ' * '
  end
end

