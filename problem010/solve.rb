require '../lib/integer'
require '../lib/sieve'

max = 2_000_000
Sieve.build_sieve max

puts (2..max).to_a.select {|i| i.prime? }.inject {|a,b| a+b}
