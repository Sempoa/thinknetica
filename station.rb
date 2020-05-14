class Station

  include InstanceCounter
  include Validation  #не знаю, почему оно ругается именно в этом классе, хотя оба модуля, точнее файлы, подключены в main

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
    raise "Имя станции должно содержать хотя бы один символ" if self.name.nil?
  end

end
