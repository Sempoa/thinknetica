class Wagon

  include Factory
  include InstanceCounter

  attr_accessor :type, :number

  def initialize(number, type)
    @number = number
    @type = type
  end

end
