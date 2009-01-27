#!/usr/bin/env ruby
# 
# real    0m0.047s

seen = { }

2.upto(100) do |a|
  2.upto(100) do |b|
    seen[a**b] = 1
  end
end

puts seen.keys.size
