class Route

  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    if station != @sations[0] && station != @sations[-1]
      @stations.delete(station)
    end
  end

=begin
  def first_station
    @stations[0]
  end

  def last_station
    @stations[-1]
  end
=end

  def all_stations
    self.stations.each {|station| puts station.name}
  end

end
