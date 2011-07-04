#!/usr/bin/env ruby

class Array
  def boustrophedon
    (0...size).map {|k| boustrophedon_at k, k }
  end

  # Returns the value of the Boustrophedon transform at T(k,n) where
  # k < size and k >= n >= 0.
  def boustrophedon_at(k,n)
    raise ArgumentError.new "k must be < size" unless k < size
    raise ArgumentError.new "n must be < size" unless n < size
    return 0 if n < 0 || k < n
    @b_cache ||= []
    @b_cache[k] ||= []

    @b_cache[k][n] ||= if k==0
                         self[k]
                       else
                         boustrophedon_at(k,n-1) + boustrophedon_at(k-1,k-n)
                       end
  end
end


