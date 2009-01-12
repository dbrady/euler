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

