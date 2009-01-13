#!/usr/bin/env/ruby
require '../lib/sieve'
require '../lib/integer'
require '../lib/symbol'

# ----------------------------------------------------------------------
# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?
# ----------------------------------------------------------------------

# Notes:

# Ouch. This will take some research. I once built a list of all the
# 32-bit primes; this list could then be used to exhaustively
# determine primacy of any 64-bit number in a minute on a 100Mhz
# machine. Generating that list took about 10 hours, however, and the
# Euler challenge says everything should run in under a minute.
# There's got to be a way to do prime factorization, then.

# dbrady 2009-01-11: Okay, let's just brute force it for now....

num = 600851475143
sqrt = Math.sqrt(num).to_i



puts "Building prime sieve up to #{sqrt}..."
Sieve.build_sieve sqrt

puts "Factoring 600851475143..."
f = 600851475143.factors

puts "Finding largest prime factor..."
puts f.select {|i| i.prime? }.max

# puts 600851475143.factors.select(&:prime?).max


