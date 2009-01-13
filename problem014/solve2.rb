#!/usr/bin/env ruby
require '../lib/integer.rb' # for Numeric#even?

class Collatz
  def initialize
    @hash = { 1 => 1 }
  end
  def [](k)
    @hash[k] ||= 1 + (k.even? ? self[k/2] : self[3*k+1])
  end
end
h = Collatz.new
n = 0
l = 0
1_000_000.downto(1) do |num|
  n,l = num,h[num] if h[num]>l
end
puts "#{n} => #{l}"
