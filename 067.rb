#!/usr/bin/env ruby

require 'open-uri'

triangle = open('http://projecteuler.net/project/triangle.txt').read.split("\n").map{|line| line.split(' ').map(&:to_i)}

(triangle.size-2).downto(0).each do |row_idx|
  triangle[row_idx].each_with_index { |_, idx|
    triangle[row_idx][idx] += [
      triangle[row_idx+1][idx], 
      triangle[row_idx+1][idx+1]
    ].max
  }
end

p triangle[0][0]
