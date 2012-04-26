class ParamError < StandardError

end

class Person
  attr_accessor :name, :skills, :position
  attr_reader :age

  def initialize(name)
    raise ParamError unless name.is_a?(String)
    @name = name
    @skills = []
    @position = []
  end

  def add_skill(skill)
    @skills << skill
    @skills.uniq!
  end

  def age=(num)
    num = num.to_i
    raise ParamError unless num >= 0
    @age = num
  end

  def method_missing(sym, *params, &block)
    p params
  end
end

module Say
  def hi
    "Hey #{name}!"
  end
end