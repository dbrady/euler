#!/usr/bin/env ruby1.9

# Use tail recursion in ruby!

# As seen at http://judofyr.net/posts/tailin-ruby.html

# What is the first term in the Fibonacci sequence to contain 1000 digits?

# ruby1.9: 1.006s
@acc = ->(i,f1,f2) { if f2.to_s.size >= 1000
    i
  else
    i,f1,f2 = i+1,f2,f1+f2
    redo
  end
}

def recurse
  @acc.call(0,1,0)
end

recurse

puts recurse

