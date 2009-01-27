#!/bin/sh
ruby -e "puts (2**1000).to_s.split(//).map{|i|i.to_i}.inject{|a,b| a+b}"
