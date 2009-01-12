#!/usr/bin/env ruby -w

t=IO.readlines("triangle.txt").map{|l|l.split.map{|i|i.to_i}};
m={}
sum=lambda{|x,y| y>=t.size ? 0 : m["#{x}/#{y}"] ||= t[y][x] + [sum[x,y+1],sum[x+1,y+1]].max}
puts sum[0,0]
