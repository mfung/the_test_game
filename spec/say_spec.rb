require 'spec_helper'

describe Say do
  describe "hi" do
    it "prints the user's name" do
      class Foo; include Say; attr_accessor :name; end
      f = Foo.new
      f.name = "bar_#{rand(10)}"
      f.hi.should == ("Hey #{f.name}!")
    end
  end
end