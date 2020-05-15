class Train

  include InstanceCounter
  include Factory
  include Validation
  FORMAT = /^([a-zа-я]|\d){3}-?([a-zа-я]|\d){2}$/i

  attr_accessor :number, :route, :station, :speed, :type, :wagons

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  def initialize(number, type)
    @number = number
    @type = type
    validate!
    @speed = 0
    @wagons = []
    @@trains[number] = self
    register_instance
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
    @station.get_train(self)
  end

  def move_prev
    if prev_station
      @station.send_train(self)
      @station = self.route.stations[self.index - 1]
      @station.get_train(self)
    end
  end

  def move_next
    if next_station
      @station.send_train(self)
      @station = self.route.stations[self.index + 1]
      @station.get_train(self)
    end
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

  protected #используется внутри классов, доступ пользователю не нужен

  def validate!
    raise "Недопустимый формат номера" if number !~ FORMAT
  end

  def index
    self.route.stations.index(station)
  end

end

