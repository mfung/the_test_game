require 'rubygems'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/mock'
require '~/Code/the_test_game/main'

describe Person do
  describe "init" do
    it "requires a name" do
      -> { Person.new() }.must_raise ArgumentError
      -> { Person.new([])}.must_raise ParamError
    end

    it "sets the name" do
      d = Person.new("foo")
      d.name.must_equal "foo"
    end

    it "sets the skils" do
      d = Person.new("foo")
      d.skills.must_be_empty
    end
  end

  describe "age" do
    it "sets the age" do
      d = Person.new("foo")
      d.age = "10"
      d.age.must_equal 10
      -> { d.age = -1 }.must_raise ParamError
    end
  end

  describe "run" do
    it "makes the person run" do
      p = Person.new("joe")
      p.run(x: 10, distance: 15)
      p.position.must_equal([10, 0])
    end
  end

  describe "add_skill" do
    it "adds a skill to @skills" do
      d = Person.new("foo")
      d.add_skill("foo")
      d.skills.must_equal ["foo"]
    end

    it "won't duplicate skills" do
      d = Person.new("foo")
      d.add_skill("foo")
      d.add_skill("foo")
      d.skills.must_equal ["foo"]
    end
  end

end

describe Say do
  describe "hi" do
    it "prints the user's name" do
      class Foo; include Say; attr_accessor :name; end
      f = Foo.new
      f.name = "bar_#{rand(10)}"
      f.hi.must_equal("Hey #{f.name}!")

    end
  end
end