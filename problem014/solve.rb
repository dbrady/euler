#!/usr/bin/env ruby1.9
#!/usr/bin/env jruby

# This is quite elegant, but also VERY slow under MRI 1.8. Run under
# jruby or ruby1.9!

# See solve2.rb for a fast Ruby 1.8 solution. Here's why this is slow:
# 
# - Initting a hash with a proc is clever but slow. 100s -> 16s after
#   writing code to cache the results by hand.
# 
# - Looping with downto instead of using a map prevents duplication of
#   the array. This results in another 16s -> 4s speed impromevent.
# 
# - Interestingly, I noticed that h might be aliasing to the external
#   h variable, so I changed the inner variables to |hash,key|. This
#   added 20sec to the execution time. Curious.


h = Hash.new {|h,k| h[k] = (1 + ((k % 2 == 0) ? h[k/2] : h[3*k+1])) }
h[1] = 1
puts m = (1..1000000).map {|i| h[i]}.max
puts "#{h.index m} => #{m}"
