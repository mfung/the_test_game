require 'spec_helper'

describe Person do
  describe "on initialization" do
    it "requires a name" do
      expect { Person.new() }.to raise_error(ArgumentError)
      expect { Person.new([])}.to raise_error(ParamError)
    end

    it "sets the name" do
      d = Person.new("foo")
      d.name.should == "foo"
    end

    it "sets the skils" do
      d = Person.new("foo")
      d.skills.should be_empty
    end

    it "sets the age" do
      d = Person.new("foo")
      d.age.should_not be_nil
    end
  end

  describe "age" do
    it "sets the age" do
      d = Person.new("foo")
      d.age = "10"
      d.age.should == 10
      expect { d.age = -1 }.to raise_error(ParamError)
    end
  end

  describe "position" do
    before(:each) do
      @p = Person.new("bob")
    end

    it "starts with a default position" do
      @p.position.should == [0,0]
    end

    it "allows the position to be set" do
      @p.position = [50, -100]
      @p.position.should == [50, -100]
    end

    it "errors if position is invalid" do
      expect { @p.position = nil }.to raise_error(ArgumentError)
      expect { @p.position = "someString" }.to raise_error(ArgumentError)
    end
  end

  describe "run" do
    it "makes the person run" do
      p = Person.new("joe")
      p.run(x: 10, distance: 15)
      p.position.should == [10, 0]
    end
  end

  describe "add_skill" do
    it "adds a skill to @skills" do
      d = Person.new("foo")
      d.add_skill("foo")
      d.skills.should == ["foo"]
    end

    it "won't duplicate skills" do
      d = Person.new("foo")
      d.add_skill("foo")
      d.add_skill("foo")
      d.skills.should == ["foo"]
    end
  end
end