require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

require 'enumerable'

describe Enumerable do
  describe "map_with_index" do
    it "should map with index" do
      [5,6,7].map_with_index { |item, idx| [item, idx]}.should == [[5,0], [6,1], [7,2]]
    end 
  end 
  
  describe "sum" do
    it "[3,4,5].sum should == 12" do
      [3,4,5].sum.should == 12
    end
    
    it "['a','b','c'].sum should == 'abc'" do
      ['a', 'b', 'c'].sum.should == 'abc'
    end
  end

  describe "product" do
    it "[3,4,5].product should == 60" do
      [3,4,5].product.should == 60
    end
  end
end 


