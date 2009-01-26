require '../lib/integer'
require '../lib/sieve'

MAX = 2_000_000

# My original solution. Clean, but memory hoggy because it creates a
# 2M-element array.
def sieve1
  # 6.810s under MRI 1.8.6p114
  # 2.864s under MRI 1.9
  # 6.927s under jruby
  Sieve.build_sieve MAX
  puts (2..MAX).to_a.select {|i| i.prime? }.inject {|a,b| a+b}
end

# Broke out the select/inject into a loop to avoid building a 2M
# array. Saves about 1.2s on MRI 1.8 and jruby, and 0.2s in 1.9.
# That's an 18% optimization on MRI 1.8 and 1.9, and about 7% on
# jruby.
def sieve2
  # 5.664s under MRI 1.8.6p114
  # 2.544s under MRI 1.9
  # 5.666s under jruby
  Sieve.build_sieve MAX
  sum = 0
  2.upto(MAX) {|n| sum += n if n.prime? }
  puts sum
end

# I actually started with the sieve1 model above, but wrote the
# trialdiv to compare against a Randy Tayler's PHP solution.
def trialdiv
  sum = 0
  primes = [2]
  3.upto(MAX) do |n|
    sqrt = Math.sqrt(n)
    prime = true
    k = 0
    s = primes.size
    while primes[k] <= sqrt
      if n % primes[k] == 0
        prime = false
        break
      end
      k += 1
    end
    if prime
      primes << n
    end
  end
  puts primes.inject { |a,b| a+b }
end

sieve1
