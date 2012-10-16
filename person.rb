class Person
  attr_accessor :name, :skills, :position
  attr_reader :age

  def initialize(name)
    raise ParamError unless name.is_a?(String)
    @name = name
    @skills = []
    @position = [0, 0]
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

  def position=(position)
    position = [position] unless position.is_a? Array
    position_is_valid = position.size === 2 && position.all?{ |p| p.is_a? Integer }
    raise ArgumentError unless position_is_valid
    @position = position
  end

  def run(args)
    raise ParamError unless args.is_a? Hash
    x = args[:x] || 0
    y = args[:y] || 0
    self.position = [x,y]
  end

  def method_missing(sym, *params, &block)
    p params
  end
end