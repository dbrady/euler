require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

require 'smooth'

describe SmoothGenerator do
  before(:each) do
    @hg1 = SmoothGenerator.new 1
    @hg2 = SmoothGenerator.new 2
    @hg3 = SmoothGenerator.new 3
  end 

  it "should get next answer" do
    @hg3.get.should == 6
    @hg3.get.should == 9
    @hg3.get.should == 15
  end
  
  it "should peek the next answer without changing it" do
    4.times do 
      @hg1.peek.should == @hg1.get
      @hg2.peek.should == @hg2.get
      @hg3.peek.should == @hg3.get
    end
  end
  
  it "should return nil when exhausted" do
    3.times { [@hg1, @hg2, @hg3].each { |hg| hg.get }}
    @hg1.peek.should be_nil
    @hg2.peek.should be_nil
    @hg3.peek.should be_nil
    @hg1.get.should be_nil
    @hg2.get.should be_nil
    @hg3.get.should be_nil
    
    # And once nil, it should stay nil...
    @hg1.peek.should be_nil
    @hg2.peek.should be_nil
    @hg3.peek.should be_nil
    @hg1.get.should be_nil
    @hg2.get.should be_nil
    @hg3.get.should be_nil
  end 
end
  
describe SmoothStream do
  describe "for 5-smooth numbers" do
    before(:each) do
      @hamming = SmoothStream.new(5)
    end
    
    it "should generate first 10 hamming numbers 1,2,3,4,5,6,8,9,10,12" do       
      (1..10).map { @hamming.get }.should == [1,2,3,4,5,6,8,9,10,12]
    end
    
    it "should find 1105 hamming numbers below 10**8" do
      nums = 0
      nums += 1 while @hamming.get <= 100_000_000
      nums.should == 1105
    end 
  end
end
