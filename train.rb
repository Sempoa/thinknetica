class Train

  attr_reader :number, :route, :station, :speed, :type, :wagons

  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
  end

  def plus_speed(speed)
    @speed += speed
  end

  def minus_speed(speed)
    if @speed >= speed
      @speed -= speed
    end
  end

  def add_wag(wagon)
    if wagon.type == @type
      if @speed == 0
        @wagons << wagon
      end
    end
  end

  def del_wag(wagon)
    if @wagons.size > 0
      if @speed == 0
        @wagons.delete(wagon)
      end
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
