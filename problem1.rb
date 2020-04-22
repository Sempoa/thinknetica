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
    list = Array.new
    self.trains.each do |train|
      if train.type == type
        list.append(train)
      end
    end
    return list
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
    @stations.delete(station)
  end

  def first_station
    @stations[0].name
  end
  def last_station
    @stations[-1].name
  end

  def all_stations
    list = Array.new
    self.stations.each do |station|
        list.append(station.name)
    end
    return list
  end

end

class Train
  attr_reader :number, :type , :route, :station, :speed, :count_wag, :station_index

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
    else
      "Wrong speed"
    end
  end

  def add_wag
    if @speed == 0
      @count_wag += 1
    else
      "Stop the train"
    end
  end

  def del_wag
    if @count_wag > 0
      if @speed == 0
        @count_wag -= 1
      else
        "Stop the train"
      end
    else
      "No wagons"
    end
  end

  def route=(route)
    @route = route
    @station = self.route.stations.first
    @station.get_train(self)
    @station_index = self.route.stations.index(@station)
  end

  def next_station
    if @station_index != -1
      self.route.stations[@station_index + 1]
    else
      "You are at the last station"
    end
  end

  def prev_station
    if @station_index != 0
      self.route.stations[@station_index - 1]
    else
      "You are at the first station"
    end
  end

  def move_next
    if @station_index != -1
      @station.send_train(self)
      @station = self.route.stations[@station_index += 1]
      @station.get_train(self)
    else
      "Last station"
    end
  end

  def move_prev
    if @station_index != 0
      @station.send_train(self)
      @station = self.route.stations[@station_index -= 1]
      @station.get_train(self)
    else
      "First station"
    end
  end

end

