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
end
