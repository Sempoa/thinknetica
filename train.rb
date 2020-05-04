class Train

  attr_reader :number, :route, :station, :speed, :type, :wagons

  def initialize(number, type)
    @number = number
    @speed = 0
    @wagons = []
    @type = type
  end

  def plus_speed(speed)
    @speed += speed
  end

  def add_wag(wagon)
    if @speed == 0
      @wagons << wagon
    end
  end

  def minus_speed(speed)
    if @speed >= speed
      @speed -= speed
    end
  end

  def del_wag(wagon)
    if @speed == 0
      @wagons.delete(wagon)
    end
  end

  def route=(route)
    @route = route
    @station = self.route.stations.first
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

protected
#этот метод используется только внутри классов. Доступ для пользователя не нужен
  def index
    self.route.stations.index(@station)
  end

end
