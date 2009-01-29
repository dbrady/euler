#!/usr/bin/env ruby
require 'date'

puts (1901..2000).map {|year| (1..12).map {|month| Date.parse("#{year}-#{month}-01").wday == 0}}.flatten.select{|i|i}.size
