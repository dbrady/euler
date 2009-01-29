#!/usr/bin/env ruby
require '../lib/enumerable'
require '../lib/string'

names = IO.readlines("names.txt")[0].split(/,/).map {|n| n.gsub /"/, ""}.sort

puts names.map_with_index {|name, index| (index+1) * name.map_bytes {|b| b - 64}.sum }.sum
