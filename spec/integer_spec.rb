require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

require 'integer'

describe Integer do
  describe "factorial" do
    it "0.fact should be 1" do
      0.fact.should == 1
    end 
    
    it "1.fact should be 1" do
      1.fact.should == 1
    end
    it "2.fact should be 2" do
      2.fact.should == 2
    end
    it "3.fact should be 6" do
      3.fact.should == 6
    end
    
    it "10.fact should be 3628800" do
      10.fact.should == 3628800
    end
    
    it "should raise on negative numbers" do
      lambda { -3.fact }.should raise_error(ArgumentError)
    end
    
  end

  describe "even" do
    it "2 should be even" do
      2.should be_even
    end
    it "3 should not be even" do
      3.should_not be_even
    end
    it "0 should be even" do
      0.should be_even
    end
  end 
  
  describe "odd" do
    it "1 should be odd" do
      1.should be_odd
    end
    it "4 should not be odd" do
      4.should_not be_odd
    end
    it "0 should not be odd" do
      0.should_not be_odd
    end
  end
  
  describe "factors" do
    it "should give all factors, sorted" do
      20.factors.should == [1, 2, 4, 5, 10, 20]
    end
    
    it "should not cut off sqrt on perfect squares" do
      16.factors.should == [1, 2, 4, 8, 16]
    end      
  end

  describe "divisors" do
    it "should give all factors, sorted, minus self" do
      20.divisors.should == [1, 2, 4, 5, 10]
    end
  end
  
  describe "amicable?" do
    it "should be true for 220" do
      220.should be_amicable
    end
    
    it "should not be true for 221" do
      221.should_not be_amicable
    end
    
    it "should return false for 1" do
      1.should_not be_amicable
    end
    
    it "should not be amicable if the divisor sum is the same number" do
      6.should_not be_amicable
    end
  end
  
  describe "abundant?" do
    it "should be true for 12" do
      12.should be_abundant
    end
    
    it "should not crash on 1" do
      1.should_not be_abundant
    end
  end
  
  describe "deficient?" do
    it "should be true for deficient numbers" do
      5.should be_deficient
      17.should be_deficient
      9.should be_deficient
    end
    
    it "should not crash on 1" do
      # I don't really know if 1 is deficient or not. Is has NO proper
      # divisors, but that's technically not the same thing as saying
      # the sum of its proper divisors is zero....
      1.should_not be_deficient
    end
  end
  
  describe "perfect?" do
    it "should be true for perfect numbers" do
      6.should be_perfect
    end

    it "should not crash on 1" do
      1.should_not be_perfect
    end
  end
end

