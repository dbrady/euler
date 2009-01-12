#!/usr/bin/env ruby
require '../lib/numeric.rb'

h = Hash.new {|h,k| h[k] = (1 + (k.even? ? h[k/2] : h[3*k+1])) }

h[1] = 1

 # Note: this runs in about 100s under MRI on my machine. The official
# rules say it should run in under a minute. Happily, jruby runs this
# code in just over 10 *seconds*, so I'm done here.
m = (1..1000000).map {|i| h[i]}.max

puts "#{h.index(m)} => #{m}"
