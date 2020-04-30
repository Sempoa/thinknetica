class Station

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
    puts "Создана станция #{@name}"
  end

  def get_train(train)
    self.trains << train
    #puts "На станцию #{self.name} добавлен поезд #{train}" кажется, это не нужно тут
  end

  def send_train(train)
    self.trains.delete(train)
    #puts "Со станции #{self.name} отпрален поезд #{train}" аналогично
  end

=begin
  def trains_type(type)
    @trains.select {|train| train.type == type}
  end
=end

end
