class Numeric
  def even?
    (self % 2) == 0
  end

  def odd?
    (self % 2) == 1
  end

  # Returns all factors of a number, in order.
  def factors
    k = 1
    max = Math.sqrt(self).ceil
    lofacs = []
    hifacs = []
    while k <= max.ceil
      if (self.to_f/k) == (self.to_i/k)
        lofacs << k
        hifacs << self/k unless self/k == k
      end
      k += 1
    end
    lofacs + hifacs.reverse
  end
end

