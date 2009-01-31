#!/usr/bin/env ruby
require '../lib/array'

# ruby   : 27.311s
# ruby1.9: 10.455s
# jruby  : 12.628s

n = 0
"0123456789".split(//).permute do |s|
  n += 1
  if n == 1_000_000
    puts s * ''
    break
  end
end

