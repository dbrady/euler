require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

require 'sieve'

describe Sieve do
  before(:all) do
    Sieve.build_sieve(100)
  end
  
  describe "primes_below" do
    it "should return 2,3,5 for 6" do
      6.primes_below.should == [2,3,5]
    end
    
    it "should return 2,3,5 for 7" do
      7.primes_below.should == [2,3,5]
    end
  end 
end
