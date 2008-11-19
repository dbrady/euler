#!/usr/bin/env ruby

class Numeric
  def even?
    (self % 2) == 0
  end

  def odd?
    (self % 2) == 1
  end
end

h = Hash.new {|h,k| h[k] = (1 + (k.even? ? h[k/2] : h[3*k+1])) }

h[1] = 1

1.upto(10) do |i|
  puts "#{i}: #{h[i]}"
end

m = (1..1000000).map {|i| h[i]}.max

puts "#{h.index(m)} => #{m}"
