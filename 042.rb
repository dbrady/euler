#!/usr/bin/env ruby

require 'open-uri'

words = open('http://projecteuler.net/project/words.txt').read.split(',').map{|word| word[1..-2]}

def triangle(n)
  (n*(n+1))/2
end

def triangle?(number)
  $triangles = [1]
  
  while number > $triangles.last
    $triangles << triangle($triangles.length + 1)
  end
  
  $triangles.include?(number)
end

def word_to_number(word)
  word.split(//).reduce(0){|sum, char| char[0] - ?A + 1 + sum}
end

puts words.reduce(0){|sum, word| 
  triangle?(word_to_number(word)) ? sum + 1 : sum
}
