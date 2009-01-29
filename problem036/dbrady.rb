#!/usr/bin/env ruby

sum=0

1.upto(999999) do |i|
  sd,sb = i.to_s,i.to_s(2)
  sum += i if sd.reverse==sd && sb.reverse==sb
end

puts sum

