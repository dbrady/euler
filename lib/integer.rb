class Integer
  @@factorials = [1, 1]

  def even?
    (self & 0x1) == 0
  end

  def odd?
    (self & 0x1) == 1
  end

  # Returns the number of digits in this number in the chosen base.
  # E.g. 99.digits => 2, 100.digits => 3, 255.digits(16) => 2
  def digits(base=10)
    1 + (Math.log(self) / Math.log(base)).floor
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

  # Returns proper divisors of a number.
  # 220.divisors => 1,2,4,5,10,11,20,22,44,55,110.
  def divisors
    factors[0..-2]
  end

  def fact
    raise ArgumentError, "Factorials can only be taken on positive numbers" if self < 0
    while @@factorials.size < self+1
      @@factorials << @@factorials[-1] * @@factorials.size
    end
    @@factorials[self]
  end
  alias factorial fact
  alias f! fact

  # True if the number is amicable. Okay, this is a bit esoteric, but
  # a number is amicable if...
  #
  # You take the sum of the proper divisors (all factors but itself)
  # of a number, this gives you some number. If you sum the proper
  # divisors of THAT number and you get the original number, then your
  # number is amicable.
  #
  # E.g. 220 has proper divisors [1,2,4,5,10,11,20,22,44,55,110].
  # These sum to 284. 284's proper divisors are [1,2,4,71,142], these
  # sum to 220. So 220 is amicable. (...and so is 284.)
  def amicable?
    return false if self == 1
    s1 = self.divisors.inject { |a,b| a+b}
    self != s1 && s1.divisors.inject { |a,b| a+b} == self
  end

  # True if the sum of proper divisors equals self.
  def perfect?
    return false if self == 1
    self == self.divisors.inject{ |a,b| a+b}
  end

  # True if the sum of the proper divisors > self
  def abundant?
    return false if self == 1
    self < self.divisors.inject{ |a,b| a+b}
  end

  # True if the sum of the proper divisors < self
  def deficient?
    return false if self == 1
    self > self.divisors.inject{ |a,b| a+b}
  end
end

