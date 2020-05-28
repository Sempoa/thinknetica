class Wagon

  include Factory
  include InstanceCounter
  include Validation
  FORMAT = /^([a-zа-я]|\d){1,50}$/i

  attr_accessor :type, :number, :space, :occupied_space
  validate :number, :format, FORMAT

  def initialize(number, value, type)
    @number = number
    @space = value
    @type = type
    validate!
    @occupied_space = 0
    register_instance
  end

  def take_value(take)
    if free_value >= take
      self.occupied_space += take
    end
  end

  def occupied_value
    @ccupied_space
  end

  def free_value
    @space - @occupied_space
  end
  #-----------------------------------------------VALIDATE
=begin  
  protected

  def validate!
    raise "Недопустимый формат номера" if self.number.nil?
    raise "Недопустимый формат номера" if self.number !~ FORMAT
  end
=end
end
