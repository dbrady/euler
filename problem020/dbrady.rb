#!/usr/bin/env ruby

# Find the sum of the digits in 100!

require "../lib/integer"

puts 100.fact.to_s.split(//).map{|i| i.to_i}.inject{|a,b| a+b}

