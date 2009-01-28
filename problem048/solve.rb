#!/usr/bin/env ruby
puts (1..1000).map {|i| i**i}.inject {|a,b| a+b}.to_s[-10..-1]
