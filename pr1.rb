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

  def trains_type(type)
    @trains.select {|train| train.type == type}
  end

end

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

  def first_station
    @stations[0]
  end

  def last_station
    @stations[-1]
  end

  def all_stations
    self.stations.each {|station| puts station.name}
  end

end

class Train

  attr_reader :number, :type , :route, :station, :speed, :count_wag

  def initialize(number, type, count_wag)
    @number = number
    @type = type
    @count_wag = count_wag
    @speed = 0
  end

  def plus_speed(speed)
    @speed += speed
  end

  def minus_speed(speed)
    if @speed >= speed
      @speed -= speed
    end
  end

  def add_wag
    if @speed == 0
      @count_wag += 1
    end
  end

  def del_wag
    if @count_wag > 0
      if @speed == 0
        @count_wag -= 1
      end
    end
  end

  def route=(route)
    @route = route
    @station = self.route.stations.first
  end

  def index
    self.route.stations.index(@station)
  end

  def next_station
    if self.index != -1
      self.route.stations[self.index + 1]
    end
  end

  def prev_station
    if self.index != 0
      self.route.stations[self.index - 1]
    end
  end

  def move_next
    if next_station
      @station.send_train(self)
      @station = self.route.stations[self.index + 1]
      @station.get_train(self)
    end
  end

  def move_prev
    if prev_station
      @station.send_train(self)
      @station = self.route.stations[self.index - 1]
      @station.get_train(self)
    end
  end

end
