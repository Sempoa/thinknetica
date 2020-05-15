class Station

  include InstanceCounter
  include Validation
  FORMAT = /^([a-zа-я]|\d){2,50}$/i

  attr_accessor :name, :trains
  
  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def get_train(train)
    self.trains << train
  end

  def send_train(train)
    self.trains.delete(train)
  end

  protected

  def validate!
    raise "Имя станции должно содержать хотя бы два символа" if self.name.nil?
    raise "Имя станции должно содержать хотя бы два символа" if self.name !~ FORMAT
  end

end
