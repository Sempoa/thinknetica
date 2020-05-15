class Wagon

  include Factory
  include InstanceCounter
  include Validation
  FORMAT = /^([a-zа-я]|\d){1,50}$/i

  attr_accessor :type, :number

  def initialize(number, type)
    @number = number
    @type = type
    validate!
    register_instance
  end

  protected

  def validate!
    raise "Недопустимый формат номера" if self.number.nil?
    raise "Недопустимый формат номера" if self.number !~ FORMAT
  end
  
end
