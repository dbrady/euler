#!/usr/bin/env ruby

# Calculate the sums of the diagonals of a 1001x1001 spiral.

# A 5x5 spiral's diagonals sum to 101.

# sum this up by starting at 1, then add 2 four times, taking each
# numbe. Then add 4 4 times. Each time is a loop around the spiral,
# each number touched is a corner.

# The math for this is not immediately clear to me so I'm just going
# to build this iteratively:

grid_size = 1
sum = 1
counter = 2
number = 1

while grid_size < 1001
  4.times { number += counter; sum += number }
  counter += 2
  grid_size += 2
end

puts sum

