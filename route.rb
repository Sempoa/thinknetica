class Route

  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    puts "Создан новый маршрут от станции #{first_station.name} до станции #{last_station.name}"
  end

  def add_station(station)
    @stations.insert(-2, station)
    puts "В маршрут #{self} добавлена станция #{station.name}"
  end

  def del_station(station)
    if station != @sations[0] && station != @sations[-1]
      @stations.delete(station)
      puts "Из маршрута #{self} удалена станция #{station.name}"
    else
      puts "Станции #{station.name} станции нет в маршруте"
    end
  end

=begin
  def first_station
    puts "Первая станция маршрута #{self}: #{@stations[0]}"
  end

  def last_station
    puts "Последняя станция маршрута #{self}: #{@stations[-1]}"
  end
=end

  def all_stations
    puts "Все станции маршрута #{self.name}: #{self.stations.each {|station| puts station.name}}"
  end

end
