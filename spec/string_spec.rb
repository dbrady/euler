require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

require 'string'

describe String do
  describe "map_bytes" do
    it "should map bytes" do
      "ABC".map_bytes { |b| b }.should == [65, 66, 67]
    end 
  end 
end 
