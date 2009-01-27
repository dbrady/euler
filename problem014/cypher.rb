#!/usr/bin/env ruby

# Map n => length
$cache = {1 => 1}

def chain(n)
  $cache[n] ||= 1 + chain((n & 0x1) == 0 ? n / 2 : 3*n + 1)
end

best_number = 0
best_length = 0

1_000_000.downto(1) do |num|
  length = chain(num)
  if length > best_length
    best_number = num
    best_length = length
  end
end

puts "#{best_number} with l=#{best_length}"