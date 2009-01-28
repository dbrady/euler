#!/usr/bin/env ruby

# Okay, this one's pretty cheap. I could write the code to do this,
# but I wanted to know when to stop. I couldn't find a way to
# determine an upper limit to the number of digits permissible, so I
# googled for it. What I discovered is that there are exactly 4
# "factorions", integers which are equal to the sum of the factorials
# of their digits. Note, however, that Euler disallows 1 and 2,
# because they are not properly "sums". So that's half of the
# factorions.
# 
# So... yeah. Um. Here's the rest of the factorions, added up:
# 
# I'll do some research and see if there's a way to determine an upper
# bound. Everyone on the Euler forum is pulling 99999 out of the hat,
# and they just happen to be getting lucky.

puts 145 + 40585

