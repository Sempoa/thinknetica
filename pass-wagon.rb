class PassWagon < Wagon

  def initialize(number, value, type = 'passenger')
    super
  end

  def take_value
    super(1)
  end

end

