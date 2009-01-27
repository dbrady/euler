#!/usr/bin/env ruby

max = 1001**2
step = 2
number = sum = 1

while number < max
  4.times {
    number += step
    sum += number
  }
  step += 2
end

puts "\n", sum
