# Sieve of Eratosthenes. Fast, but needs RAM.
class Sieve
  
  # Build up the sieve. Must be called beforehand.
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
  
  # Returns true if n is Prime.
  def self.prime?(n)
    begin
      @@sieve[n.floor] == 1
    rescue RangeError => e
      puts "WTF? Since when is #{n} too big to fit in a Fixnum?"
      raise e
    end 
  end
  
  # Utility method. Get the sieve. (For debugging.)
  def self.sieve
    @@sieve
  end
end

class Bignum
  def prime?
    Sieve.prime? self
  end
end

class Fixnum
  def prime?
    Sieve.prime? self
  end
end

