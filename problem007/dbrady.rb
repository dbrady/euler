# 2013-04-19 dbrady notes:
# Thanks to Ruby 2 including 'prime' in stdlib, this entire program
# can be written as:
#
# require 'prime'
# puts Prime.take(10_001).last


$:<< "../lib"

require 'sieve'

Sieve.build_sieve 110000
prime = 0
2.upto(110000) do |i|
  if Sieve.sieve[i] == 1
    prime += 1
    if prime == 10001
      puts i
      exit
    end
  end
end
