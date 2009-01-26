#!/usr/bin/env ruby

# What is the first term in the Fibonacci sequence to contain 1000 digits?

f1,f2,k = 1,1,2

f1,f2,k = f2,f1+f2,k+1 while f2.to_s.size < 1000

puts k



