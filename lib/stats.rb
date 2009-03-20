require 'enumerable'  # for Enumerable#sum
class Array
  def mean
    inject {|a,b| a+b} / size
  end
  
  # get the diffs from mean, square them and sum them, then divide by size-1 and take the sqrt.
  def stddev
    m = mean
    Math.sqrt(map {|a| (a-m)**2 }.sum / (size-1))
  end
end


