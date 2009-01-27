#  Created by cypher on 2007-03-12.
#  Copyright (c) 2007. All rights reserved.

require 'mathn'

def atkin_sieve(limit)
  limit += 1
  length = (limit/2) - 1 + limit % 2
  sieve = [false] * (length + 1)

  x_max, x2, xd = Integer(Math.sqrt((limit-1)/4.0)), 0, 4
  (4...(8*x_max)).step(8) do |xd|
    x2 += xd
    y_max = Integer(Math.sqrt(limit-x2))
    n, n_diff = x2 + y_max**2, (y_max << 1) - 1
    if n % 2 == 0
      n -= n_diff
      n_diff -= 2
    end

    ((n_diff-1)<<1).step( 0, -8 ) do |d|
      m = n % 12
      if m == 1 or m == 5
        m = n >> 1
        sieve[m] = !sieve[m]
      end
      n -= d
    end
  end  

  x_max = Integer(Math.sqrt((limit - 1)/3.0))
  x2, xd = 0, 3

  (3...(6*x_max + 2)).step(6) do |xd|
    x2 += xd
    y_max = Integer(Math.sqrt(limit - x2))
    n, n_diff = x2 + y_max**2, (y_max << 1) - 1

    if n % 2 == 0
      n -= n_diff
      n_diff -= 2
    end

    ((n_diff - 1) << 1).step( 0, -8 ) do |d|
      if n % 12 == 7
        m = n >> 1
        sieve[m] = !sieve[m]
      end
      n -= d
    end
  end

  x_max = Integer( (2 + Math.sqrt(4-8*(1-limit)))/4 )
  y_min, x2, xd = -1, 0, 3

  (1..x_max).each do |x|
    x2 += xd
    xd += 6

    y_min = (((Integer(Math.sqrt(x2 - limit).ceil) - 1) << 1) -2) << 1 if x2 >= limit

    n, n_diff = ((x**2 + x) << 1) - 1, (((x-1) << 1) - 2) << 1

    n_diff.step( y_min+1, -8 ) do |d|
      if n % 12 == 11
        m = n >> 1
        sieve[m] = !sieve[m]
      end
      n += d
    end
  end

  primes = [2,3]
  return primes[[0, limit-2].max] if limit <= 3

  ((5>>1)...((Integer(Math.sqrt(limit)) + 1) >> 1)).each do |n|
    if sieve[n]
      primes << (n << 1) + 1

      ((((n << 1) + 1)**2)...limit).step( 2*((n << 1) + 1)**2 ) do |k|
        sieve[k >> 1] = false
      end
    end
  end

  s = Integer(Math.sqrt(limit)) + 1
  s+=1 if s % 2 == 0
  (s...limit).step(2) do |i|
    primes << i if sieve[i >> 1]
  end

  primes
end

# No idea where I stole it from, sorry
def erat_sieve(limit)
  return [] if limit < 2

  #The array doesn't need to include even numbers
  length = ((limit/2) - 1 + limit%2)

  # Create Bit-Array and assume all numbers in it are prime
  sieve = [true] * (length+1)

  # Only go up to square root of limit
  0.upto((Math.sqrt(limit).to_i >> 1) - 1) do |i|
    # Skip numbers that aren't marked as prime
    next if not sieve[i]

    (((i*(i+3) << 1) + 3)...length).step((i<<1) + 3) do |j|
      sieve[j] = false
    end
  end

  primes = [2]

  0.upto(length-1) do |i|
    primes << (i<<1)+3 if sieve[i]
  end

  primes
end

class Integer
  def prime?
    n = self.abs()

    return true if n == 2
    return false if n == 1 || n & 1 == 0

    d = n-1
    d >>= 1 while d & 1 == 0

    20.times do
      a = rand(n-2) + 1
      t = d
      y = ModMath.pow(a,t,n)                  # implemented below

      while t != n-1 && y != 1 && y != n-1
        y = (y * y) % n
        t <<= 1
      end

      return false if y != n-1 && t & 1 == 0
    end

    return true
  end
end

module ModMath
  def ModMath.pow(base, power, mod)
    result = 1
    while power > 0
      result = (result * base) % mod if power & 1 == 1
      base = (base * base) % mod
      power >>= 1;
    end
    result
  end
end

