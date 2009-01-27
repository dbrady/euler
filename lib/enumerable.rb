module Enumerable
  def map_with_index(&block)
    m = []
    each_index do |i|
      m << yield(self[i], i)
    end
    m
  end
  
  def sum
    self.inject{|a,b| a+b}
  end
  
  def product
    self.inject{|a,b| a*b}
  end
end


