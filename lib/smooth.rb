$: << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'symbol'
require 'sieve'

# This file contains a stream-based generator for k-smooth numbers.
# (Hamming numbers are 5-smooth).

# SmoothGenerator. For a 
class SmoothGenerator
  @@primes = [2,3,5]
  @@primes_size = @@primes.size
  
  attr_reader :base, :index
  def initialize(base)
    @base = base
    @index = 0
    @num = @base * @@primes[0]
  end
  
  def peek
    @num
  end
  
  def get
    num = @num
    @index += 1
    generate
    num
  end
  
  # DANGER: Don't change primes while generators are running.
  def self.primes=(p)
    @@primes = p
    @@primes_size = p.size 
  end
  
  def self.primes
    @@primes
  end
  
private
  def generate
#    puts "    -- SmoothGenerator#generate(): my base is #{@base}, my index is #{@index}; that prime is #{@@primes[@index]}"
    @num = if @index < @@primes_size
             @base * @@primes[@index]
           else
             nil
           end
  end
end


class SmoothStream
  attr_reader :generators
  
  def initialize(base)
    base = base + 1
    Sieve.build_sieve base
    SmoothGenerator.primes = base.primes_below
    @generators = []
  end
  
  def get
    # 1. find lowest generator number || 1 if no generators
    # 2. do a get on all generators with that number.
    # 3. delete all generators that have been exhausted
    # 4. create a new generator from the lowest number
    # 5. return that number
#    puts "  >> SmoothStream#get():"
    smallest = @generators.map(&:peek).min || 1
#    puts "  >> smallest is #{smallest}"
    @generators.each do |g|
      if g.peek == smallest
#        puts "g.get on generator #{g.base}!"
        g.get
      end
#       g.get if g.peek == smallest
    end
    @generators.delete_if {|g| g.peek.nil? }
    @generators << SmoothGenerator.new(smallest)
#    dump_generators
    smallest
  end
  
  def dump_generators
    puts '--'
    puts "[#{SmoothGenerator.primes * ','}]"
    @generators.each do |g|
      puts "#{g.base}: #{g.index} -> #{g.peek}"
    end
  end
end
