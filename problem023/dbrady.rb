#!/usr/bin/env ruby

require '../lib/integer'
require '../lib/enumerable'

abundants = (1..28123).to_a.select {|i| i.abundant? }

nums = Array.new 28124, true

abundants.each_with_index do |a,i|
  abundants[i..-1].each do |b|
    break if a+b > 28123
    nums[a+b] = false
  end
end

sum = 0
0.upto(nums.size) do |i|
  sum += i if nums[i]
end
puts sum
