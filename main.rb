require './person'

class ParamError < StandardError

end

module Say
  def hi
    "Hey #{name}!"
  end
end