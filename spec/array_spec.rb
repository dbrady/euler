require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

require 'array'

describe Array do
  describe "permutations" do
    it "should return all permutations of an array" do
      [].permutations.should == []
      [1].permutations.should == [1]
      [1,2].permutations.should == [[1,2], [2,1]]
      [1,2,3].permutations.should == [[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]]
    end
  end

  describe "permute" do
    it "should yield all permutations of a string" do
      p = []
      [].permute do |s|
        p << s
      end
      p.should == [[]]
      
      p = []
      [1].permute do |s|
        p << s
      end
      p.should == [[1]]

      p = []
      [1,2].permute do |s|
        p << s
      end
      p.should == [[1,2], [2,1]]
      
      p = []
      [1,2,3].permute do |s|
        p << s
      end
      p.should == [[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]]
    end
  end
end
