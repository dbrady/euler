class String
  def map_bytes(&block)
    bytes = []
    each_byte do |b|
      bytes << yield(b)
    end
    bytes
  end
end




