#!/usr/bin/env ruby

(1..333).each do |a|
  (a..499).each do |b|
    c = 1000 - (a+b)
    if a**2+b**2==c**2
      puts a
      puts b
      puts c
      exit
    end
  end
end

