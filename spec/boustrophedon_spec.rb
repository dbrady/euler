require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

require 'boustrophedon'

describe Array do
  describe '#boustrophedon' do
    it "should return the Boustrophedon transform of the array" do
      [1,0,0,0,0,0,0,0].boustrophedon.should == [1,1,1,2,5,16,61,272]
    end
  end

  describe '#boustrophedon_at' do
    it "should return the Boustrophedon transform of the array at T(k,n)" do
      ray = [1,0,0,0,0,0,0]

      ray.boustrophedon_at(0,0).should == 1
      ray.boustrophedon_at(1,1).should == 1
      ray.boustrophedon_at(2,2).should == 1
      ray.boustrophedon_at(3,3).should == 2
      ray.boustrophedon_at(4,4).should == 5
      ray.boustrophedon_at(5,5).should == 16
      ray.boustrophedon_at(6,6).should == 61
    end
  end
end

