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

  # Returns PI function (product of all members). Renamed from product
  # as Ruby 1.9 and random patches of Ruby 1.8.7 define Array.product
  # to return the cartesian product.
  def pi_product
    self.inject{|a,b| a*b}
  end
end


