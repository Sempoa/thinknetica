class Wagon

  include Factory
  include InstanceCounter
  include Validation
  FORMAT = /^([a-zа-я]|\d){1,50}$/i

  attr_accessor :type, :number, :value, :occupied_seats, :space_volume, :nonfree_volume, :free_seats

  def initialize(number, volume, type)
    @number = number
    @type = type
    validate!
    register_instance
  end
  #---------------------------------------------------CARGO
  def take_volume(take)
    if self.space_volume >= take
      self.space_volume -= take
      @nonfree_volume += take
    end
  end

  def occupied_volume
    @nonfree_volume
  end

  def free_volume
    self.space_volume
  end
  #----------------------------------------------------PASS
  def occupy_seats
    if self.free_seats > 0
      self.free_seats -= 1
      @occupied_seats += 1
    end
  end

  def number_occupied_seats
    @occupied_seats
  end

  def number_free_seats
    self.free_seats
  end
  #-----------------------------------------------VALIDATE
  protected

  def validate!
    raise "Недопустимый формат номера" if self.number.nil?
    raise "Недопустимый формат номера" if self.number !~ FORMAT
  end

end

