class Position
  attr_accessor :cordinate
  def initialize(cordinate)
    @cordinate = cordinate
    raise ArgumentError unless is_valid_cordinate? @cordinate
  end

  def ==(other_object)
    other_object.is_a?(Array) ? @cordinate == other_object : super 
  end

  protected
  def is_valid_cordinate?(cordinate)
    cordinate = [cordinate] unless cordinate.is_a? Array
    cordinate.size === 2 && cordinate.all? { |p| p.is_a? Integer }
  end
end