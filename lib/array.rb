class Array
  def permutations
    case size
    when 0 then []
    when 1 then self
    when 2 then [self, reverse]
    else
      pp = []
      0.upto(size-1) do |i|
        a = dup
        c = a.slice!(i)
        pp += a.permutations.map { |p| p.unshift(c) }
      end
      pp
    end
  end

  # Yields all the permutations of self into block.
  def permute(&block)
    case size
    when 0 then yield []
    when 1 then yield self
    when 2
      yield self
      yield self.reverse
    else
      0.upto(size-1) do |i|
        a = dup
        c = a.slice!(i)
        a.permute do |p|
          yield p.dup.unshift(c)
        end
      end
    end
  end
  
  def dump_permutations
    p = permutations.map { |i| i.to_s}
    s = (p.size / size.to_f).ceil
    (0..s-1).each do |y|
      puts((0..size).to_a.map {|x| p[x*s+y]} * " ")
    end
  end
end
