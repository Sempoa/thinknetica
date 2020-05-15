class Route

  include InstanceCounter
  include Validation

  attr_accessor :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    validate!
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    if station != @stations[0] && station != @stations[-1]
      self.stations.delete(station)
    end
  end

  def first_station
    @stations[0]
  end

  def last_station
    @stations[-1]
  end

=begin
  def all_stations
    self.stations.each {|station| puts station.name}
  end
=end

  protected

  def validate!
    self.stations.each do |station|
      raise "Cтанции должны быть объектом класса Station" unless station.is_a? Station
    end
    raise "Недопустимый маршрут. Начальная станция не должна совпадать с конечной" if first_station == last_station
  end

end
