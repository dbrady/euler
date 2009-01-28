#!/usr/bin/env ruby

# What is the first term in the Fibonacci sequence to contain 1000 digits?

# ----------------------------------------------------------------------
# ruby   : 0.684s
# ruby1.9: 0.527s
# jruby  : 1.513s
def iter
  f1,f2,k = 1,1,2
  f1,f2,k = f2,f1+f2,k+1 while f2.to_s.size < 1000
  puts k
end

# ----------------------------------------------------------------------
# Use tail recursion in ruby!
# As seen at http://judofyr.net/posts/tailin-ruby.html
# 
# ruby   : 0.700s
# ruby1.9: 0.511s
# jruby  : 1.502s
@acc = lambda do |i,f1,f2|
  if f2.to_s.size >= 1000
    i
  else
    i,f1,f2 = i+1,f2,f1+f2
    redo
  end
end

def recurse
  @acc.call(0,1,0)
end

recurse



