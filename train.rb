class Train

  attr_reader :number, :route, :station, :speed, :type, :wagons

  def initialize(number, type)
    @number = number
    @speed = 0
    @wagons = []
    @type = type
    puts "Создан поезд №#{@number} типа #{@type}"
  end

  def plus_speed(speed)
    @speed += speed
    puts "Скорость поезда увеличена до #{@speed} км/ч"

  end

  def minus_speed(speed)
    if @speed >= speed
      @speed -= speed
      puts "Скорость поезда уменьшена до #{@speed} км/ч"
    end
  end

  def del_wag(wagon)
    if @wagons.size > 0
      if @speed == 0
        @wagons.delete(wagon)
        puts "Вагон #{wagon} отцеплен"
      end
    end
  end

  def route=(route)
    @route = route
    @station = self.route.stations.first
    puts "Маршрут #{route} установлен для поезда #{self.number}  типа  #{self.type}"
  end

  def next_station
    if self.index != -1
      self.route.stations[self.index + 1]
      #puts "Следующая станция #{self.station.name}"
    end
  end

  def prev_station
    if self.index != 0
      self.route.stations[self.index - 1]
      #puts "Предыдущая станция #{self.station.name}"
    end
  end

  def move_next
    if next_station  # "if next_station" перестанет работать, если я добавлю puts в next_station. В задании, вроде, не написано, что мне нужно выводить следующую станцию через текстовый интерфейс, поэтому я закомментирую
      @station.send_train(self)
      @station = self.route.stations[self.index + 1]
      @station.get_train(self)
      puts "Поезд приехал на станцию #{@station.name}"
    end
  end

  def move_prev
    if prev_station  #аналогично
      @station.send_train(self)
      @station = self.route.stations[self.index - 1]
      @station.get_train(self)
      puts "Поезд вернулся на станцию #{@station.name}"
    end
  end

protected
#этот метод используется только внутри классов. Доступ для пользователя не нужен
  def index
    self.route.stations.index(@station)
  end

end
