class Station

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def get_train(train)
    self.trains << train
  end

  def send_train(train)
    self.trains.delete(train)
  end


  def trains_type
    self.trains.each { |train| puts train.type }
  end
end

class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = []
    @stations << first_station
    @stations << last_station
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    @stations.delete(station)
  end
end

class Train
  attr_reader :number, :type , :route
  attr_accessor :station, :speed, :count

  def initialize(number, type, count_wag)
    @number = number
    @type = type
    @count = count
    @speed = 0
  end

  def incr_speed(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def add_wag
    if self.speed == 0
      self.count_wag += 1
    else
      puts "Stop the train"
    end
  end

  def del_wag
    if self.speed == 0
      self.count_wag -= 1
    else
      puts "Stop the train"
    end
  end

  def route=(route)
    @route = route
    self.station = self.route.stations.first
  end

  def next_station
    self.route.stations[self.route.stations.index(self.station) + 1].name
  end

  def prev_station
    self.route.stations[self.route.stations.index(self.station) - 1].name
  end

  def move_next
    self.station = self.route.stations[self.route.stations.index(self.station) + 1]
  end
  def move_prev
    self.station = self.route.stations[self.route.stations.index(self.station) - 1]
  end
end
