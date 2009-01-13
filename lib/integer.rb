class Integer
  @@factorials = [1, 1]
  
  def even?
    (self & 0x1) == 0
  end

  def odd?
    (self & 0x1) == 1
  end

  # Returns all factors of a number, in order.
  def factors
    k = 1
    max = Math.sqrt(self)
    lofacs = []
    hifacs = []
    while k <= max
      if (self.to_f/k) == (self.to_i/k)
        lofacs << k
        hifacs << self/k unless self/k == k
      end
      k += 1
    end
    lofacs + hifacs.reverse
  end
  
  def fact
    raise ArgumentError, "Factorials can only be taken on positive numbers" if self < 0
    while @@factorials.size < self+1
      @@factorials << @@factorials[-1] * @@factorials.size
    end
    @@factorials[self]
  end
end

