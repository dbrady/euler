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
    
end
  
