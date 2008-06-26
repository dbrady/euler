#!/usr/bin/env ruby

def collatz(n)
  if n.even?
    n / 2
  else
    3*n + 1
  end
end

# Map n => length
$cache = {}

def chain(n)
  
  return 1 if n == 1
  
  unless $cache.has_key?(n)
    $cache[n] = 1 + chain(collatz(n))
  end
  
  return $cache[n]
end

$best_number = 0
$best_length = 0

1_000_000.downto(1) do |num|
  length = chain(num)
  if length > $best_length
    $best_number = num 
    $best_length = length
  end
end

puts "#{$best_number} with l=#{$best_length}"
