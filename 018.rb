#!/usr/bin/env ruby
#  
#  Not sure if you all know this already, but starting at the base proves much superior in this problem... e.g.:
#  
#  91 71 52
#  63 66 04 68
#  04 62 98 27 23
#  
#  If you reached '63' you would choose '62' over '04', so just add it to '63' to give you '125'.
#  
#  91 71 52
#  125 66 04 68
#  04 62 98 27 23
#  
#  Likewise, add the 98 to both the 66 and the 04, and the 27 to the 68... this gives you:
#  
#  91 71 52
#  125 164 102 95
#  0 0 0 0 0
#  
#  Proceed like this up the triangle... whatever integer appears at the peak is the maximum sum.


triangle = <<TRIANGLE.split("\n").map{|line| line.split(' ').map(&:to_i)}
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
TRIANGLE

(triangle.size-2).downto(0).each do |row_idx|
  triangle[row_idx].each_with_index { |_, idx|
    triangle[row_idx][idx] += [
      triangle[row_idx+1][idx], 
      triangle[row_idx+1][idx+1]
    ].max
  }
end

p triangle[0][0]

__END__

numbers = []
curr_idx = 0

(0..triangle.length-1).each do |idx|
  print "curr = #{triangle[idx][curr_idx]}"#, idx = #{idx}, curr_idx = #{curr_idx}"
  numbers << triangle[idx][curr_idx]
  
  # Make sure we don't go out of bounds
  if idx + 1 < triangle.size
    curr_idx += 1 if triangle[idx+1][curr_idx+1] > triangle[idx+1][curr_idx]
    puts ", next = #{triangle[idx+1][curr_idx]}"
  end
end

puts "\n\nsum = #{numbers.inject(&:+)}"
