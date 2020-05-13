require_relative 'instance_counter'

class Route

  include InstanceCounter

  attr_accessor :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
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

=begin
  def first_station
    @stations[0]
  end

  def last_station
    @stations[-1]
  end

  def all_stations
    self.stations.each {|station| puts station.name}
  end
=end

end
