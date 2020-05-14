class Wagon

  include Factory
  include InstanceCounter
  include Validation

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
  end
end

