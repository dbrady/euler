#!/usr/bin/env ruby

# boustrophedon.rb - Draws the boustrophedon triangle for a given array
#
# Usage: ruby boustrophedon.rb [csv of integers]
#
# ruby boustrophedon.rb 1, 2, 3, 4, 5
#
# If the csv of integers is omitted, will print the Boustrophedon
# transform of [1].concat([0]*15), which generatets the first 16
# Entringer numbers.

require "yaml"
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'integer'))
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'boustrophedon'))

args = ARGV * ''

ray = if args.size > 0 && args =~ /^[\d,-]+$/
        # Explode arg string into someting YAML can read. Tortuous but safer
        # than eval.
        str = "---\n" + args.split(',').map {|item| "- %s" % item}.join("\n")
        YAML.load str
      else
        # The Boustrophedon Transform of [1,0,0,0,...] are the "Entringer
        # Numbers", whatever THOSE are.
        [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      end

row_digits = ray.size.digits

last = ray.boustrophedon_at(ray.size-1, ray.size-1)
digits = last.digits
format = "| %#{digits}d "
spacing = (format % 0).length

(0...ray.size).each do |k|
  print "%#{row_digits}d " % k
  print ' ' * (spacing * (ray.size-(k+1))/2)
  (0..k).each do |n|
    n = k-n if k%2==1
    print format % ray.boustrophedon_at(k,n)
  end
  puts "|"
end
